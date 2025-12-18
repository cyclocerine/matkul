import os
import math
from PIL import Image, ImageDraw
import argparse

# === Konfigurasi ===
PHOTO_W_CM, PHOTO_H_CM = 3, 4
DPI = 300
MARGIN_CM = 1.0
GAP_MM = 2.5
DASH_LENGTH = 6   # panjang segmen garis (px)
GAP_LENGTH = 3    # jarak antar segmen (px)

def cm_to_px(cm): return int(round((cm / 2.54) * DPI))
def mm_to_px(mm): return int(round((mm / 25.4) * DPI))

PHOTO_W = cm_to_px(PHOTO_W_CM)
PHOTO_H = cm_to_px(PHOTO_H_CM)
MARGIN = cm_to_px(MARGIN_CM)
GAP = mm_to_px(GAP_MM)

A4_W = cm_to_px(21.0)
A4_H = cm_to_px(29.7)

# Hitung layout
def calculate_layout():
    usable_w = A4_W - 2 * MARGIN
    usable_h = A4_H - 2 * MARGIN
    cols = rows = 1
    while cols * PHOTO_W + (cols - 1) * GAP <= usable_w:
        cols += 1
    cols -= 1
    while rows * PHOTO_H + (rows - 1) * GAP <= usable_h:
        rows += 1
    rows -= 1
    return max(1, cols), max(1, rows)

COLS, ROWS = calculate_layout()
PHOTOS_PER_PAGE = COLS * ROWS

print(f"📦 Layout: {COLS} × {ROWS} = {PHOTOS_PER_PAGE} foto/halaman")
print(f"📐 Margin: {MARGIN_CM} cm | Jarak: {GAP_MM} mm | Resolusi: {DPI} PPI")

# --- Fungsi bantu ---
def ensure_portrait(img):
    w, h = img.size
    if w > h:
        img = img.rotate(90, expand=True)
    return img

def crop_to_3by4(img):
    w, h = img.size
    r = PHOTO_W_CM / PHOTO_H_CM
    if w / h > r:
        nw = int(h * r); nh = h
    else:
        nw = w; nh = int(w / r)
    left = (w - nw) // 2
    top = (h - nh) // 2
    return img.crop((left, top, left + nw, top + nh))

def prepare_photo(path):
    with Image.open(path) as img:
        ext = os.path.splitext(path)[1].lower()
        if ext in {'.jpg', '.jpeg'} and img.mode in ('RGBA', 'P'):
            img = img.convert('RGB')
        img = ensure_portrait(img)
        img = crop_to_3by4(img)
        img = img.resize((PHOTO_W, PHOTO_H), Image.LANCZOS)
        return img

def draw_dashed_rect(draw, x0, y0, x1, y1, **style):
    """Gambar persegi panjang putus-putus."""
    def draw_dashed_line(p0, p1):
        dx, dy = p1[0] - p0[0], p1[1] - p0[1]
        length = math.hypot(dx, dy)
        if length == 0: return
        ux, uy = dx / length, dy / length
        pos = 0
        while pos < length:
            s = pos
            e = min(pos + DASH_LENGTH, length)
            if s < length:
                a = (p0[0] + ux * s, p0[1] + uy * s)
                b = (p0[0] + ux * e, p0[1] + uy * e)
                draw.line([a, b], **style)
            pos = e + GAP_LENGTH

    draw_dashed_line((x0, y0), (x1, y0))  # atas
    draw_dashed_line((x1, y0), (x1, y1))  # kanan
    draw_dashed_line((x1, y1), (x0, y1))  # bawah
    draw_dashed_line((x0, y1), (x0, y0))  # kiri

def create_a4_page(photos):
    page = Image.new('RGB', (A4_W, A4_H), 'white')
    draw = ImageDraw.Draw(page)

    # Offset untuk garis potong (2 mm di luar foto)
    OFFSET_PX = mm_to_px(2.0)

    for i, photo in enumerate(photos):
        row = i // COLS
        col = i % COLS
        x = MARGIN + col * (PHOTO_W + GAP)
        y = MARGIN + row * (PHOTO_H + GAP)

        # Tempel foto
        page.paste(photo, (x, y))

        # Gambar crop guide di luar foto (dengan offset)
        guide_x0 = x - OFFSET_PX
        guide_y0 = y - OFFSET_PX
        guide_x1 = x + PHOTO_W + OFFSET_PX
        guide_y1 = y + PHOTO_H + OFFSET_PX

        draw_dashed_rect(
            draw,
            guide_x0, guide_y0,
            guide_x1, guide_y1,
            fill=(0, 0, 0),
            width=1
        )

    return page

# --- Main ---
def main(input_folder, output_path):
    supported_ext = {'.jpg', '.jpeg', '.png', '.bmp', '.tiff', '.webp'}
    paths = [os.path.join(input_folder, f) for f in os.listdir(input_folder)
             if os.path.splitext(f)[1].lower() in supported_ext]

    if not paths:
        print("❌ Tidak ada foto!")
        return

    print(f"🖼️ Memproses {len(paths)} foto...")
    photos = []
    for p in paths:
        try:
            photos.append(prepare_photo(p))
        except Exception as e:
            print(f"⚠️ Gagal: {os.path.basename(p)} – {e}")

    print("🖨️ Menyusun ke A4 dengan crop guide putus-putus...")
    pages = []
    for i in range(0, len(photos), PHOTOS_PER_PAGE):
        batch = photos[i:i + PHOTOS_PER_PAGE]
        pages.append(create_a4_page(batch))

    if output_path.lower().endswith('.pdf'):
        pages[0].save(output_path, save_all=True, append_images=pages[1:], resolution=DPI, dpi=(DPI, DPI))
        print(f"✅ PDF siap cetak: {output_path}")
    else:
        base, ext = os.path.splitext(output_path)
        for idx, pg in enumerate(pages):
            pg.save(f"{base}_page{idx+1}{ext}", dpi=(DPI, DPI), quality=95)
        print(f"✅ {len(pages)} halaman disimpan.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="A4 sheet dengan crop guide garis putus-putus")
    parser.add_argument("input_folder", help="Folder input")
    parser.add_argument("output_file", help="Output (disarankan .pdf)")
    args = parser.parse_args()

    if not os.path.isdir(args.input_folder):
        print("❌ Folder tidak ditemukan!")
        exit(1)
    main(args.input_folder, args.output_file)