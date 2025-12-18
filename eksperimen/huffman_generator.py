import heapq
import matplotlib.pyplot as plt
import networkx as nx
from collections import Counter

# 1. Definisi Node untuk Pohon Huffman
class HuffmanNode:
    def __init__(self, char, freq):
        self.char = char
        self.freq = freq
        self.left = None
        self.right = None

    # Agar heapq bisa membandingkan node berdasarkan frekuensi
    def __lt__(self, other):
        return self.freq < other.freq

# 2. Fungsi Membangun Pohon dan Menghitung Bit
def process_huffman(text):
    # Hitung frekuensi
    freq_map = Counter(text)
    
    # Buat priority queue (min-heap)
    heap = [HuffmanNode(char, freq) for char, freq in freq_map.items()]
    heapq.heapify(heap)
    
    # Bangun pohon
    while len(heap) > 1:
        node1 = heapq.heappop(heap)
        node2 = heapq.heappop(heap)
        
        merged = HuffmanNode(None, node1.freq + node2.freq)
        merged.left = node1
        merged.right = node2
        heapq.heappush(heap, merged)
        
    root = heap[0]
    
    # Mapping kode biner dan hitung panjang bit
    codes = {}
    def get_codes(node, current_code):
        if node is None:
            return
        if node.char is not None:
            codes[node.char] = current_code
            return
        get_codes(node.left, current_code + "0")
        get_codes(node.right, current_code + "1")
    
    get_codes(root, "")
    
    # Hitung total bit
    total_bits = sum(freq_map[char] * len(codes[char]) for char in freq_map)
    
    return root, freq_map, codes, total_bits

# 3. Fungsi Visualisasi Pohon
def draw_huffman_tree(root, total_bits, save_path=None):
    G = nx.DiGraph()
    labels = {}
    edge_labels = {}

    def add_edges(node):
        node_id = id(node)
        char_disp = f"'{node.char if node.char != ' ' else '[sp]'}'" if node.char else ""
        labels[node_id] = f"{char_disp}\nf:{node.freq}"
        
        if node.left:
            G.add_edge(node_id, id(node.left))
            edge_labels[(node_id, id(node.left))] = '0'
            add_edges(node.left)
        if node.right:
            G.add_edge(node_id, id(node.right))
            edge_labels[(node_id, id(node.right))] = '1'
            add_edges(node.right)

    add_edges(root)
    
    # Layout hirarkis
    def get_pos(node, x=0, y=0, layer_width=1):
        pos = {id(node): (x, y)}
        if node.left:
            pos.update(get_pos(node.left, x - layer_width/2, y - 1, layer_width/2))
        if node.right:
            pos.update(get_pos(node.right, x + layer_width/2, y - 1, layer_width/2))
        return pos

    pos = get_pos(root)
    
    plt.figure(figsize=(14, 8))
    nx.draw(G, pos, labels=labels, with_labels=True, node_size=2000, 
            node_color="#98FB98", font_size=8, font_weight="bold", arrows=False)
    nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels, font_color='red')
    
    plt.title(f"Pohon Huffman (Total Bit yang Terbentuk: {total_bits})", size=14)
    plt.axis('off')
    
    if save_path:
        plt.savefig(save_path, dpi=150, bbox_inches='tight', facecolor='white')
        print(f"Gambar disimpan ke: {save_path}")
    
    plt.show()

# --- EKSEKUSI ---
if __name__ == "__main__":
    input_text = "daku dan dia kuliah bersama"
    root_node, freqs, bin_codes, bit_count = process_huffman(input_text)

    # Cetak Tabel Perhitungan ke Konsol
    print(f"\nString: \"{input_text}\"")
    print(f"Jumlah karakter: {len(input_text)}\n")
    print(f"{'Karakter':<12} | {'Frekuensi':<10} | {'Kode Biner':<12} | {'Panjang Bit'}")
    print("-" * 55)
    for char in sorted(freqs.keys(), key=lambda x: freqs[x], reverse=True):
        display_char = f"'{char}'" if char != ' ' else "'spasi'"
        print(f"{display_char:<12} | {freqs[char]:<10} | {bin_codes[char]:<12} | {len(bin_codes[char])} bit")

    print("-" * 55)
    print(f"TOTAL BIT HUFFMAN: {bit_count} bit")
    print(f"TOTAL BIT ASCII (8-bit): {len(input_text) * 8} bit")
    print(f"EFISIENSI: {((len(input_text) * 8) - bit_count) / (len(input_text) * 8) * 100:.1f}%")

    # Tampilkan dan simpan gambar
    draw_huffman_tree(root_node, bit_count, save_path="images/huffman_tree.png")
