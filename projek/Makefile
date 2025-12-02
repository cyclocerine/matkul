# Compiler and flags
CC = g++
CFLAGS = -Wall -o
CPPFLAGS = -I.

# Source files
SOURCES = Project1_NILAI.cpp \
          Project2_Balikkalimat.cpp \
          Project3_Rerata.cpp \
          Project4_KonversiJarak.cpp \
          Project5_UangPecahan.cpp \
          Project6_KonversiWaktu.cpp \
          Project7_KonversiAngka.cpp \
          Project8_Fifa.cpp \
          Project9_Luasdanvolume.cpp \
          Project10_Warna.cpp \
          Project11_Eskrim.cpp \
          Project12_VendingMesin.cpp \
          Project13_IsiPulsa.cpp \
          Project14_TiketBioskop.cpp \
          Project15_Awm.cpp

# Object files (automatically generated from .cpp files)
OBJECTS = $(SOURCES:.cpp=.o)

# Executables (one for each project)
TARGETS = Project1_NILAI \
          Project2_Balikkalimat \
          Project3_Rerata \
          Project4_KonversiJarak \
          Project5_UangPecahan \
          Project6_KonversiWaktu \
          Project7_KonversiAngka \
          Project8_Fifa \
          Project9_Luasdanvolume \
          Project10_Warna \
          Project11_Eskrim \
          Project12_VendingMesin \
          Project13_IsiPulsa \
          Project14_TiketBioskop \
          Project15_Awm

# Default target (builds all)
.PHONY: all
all: $(TARGETS)

# Rule to compile and link each project
Project1_NILAI: Project1_NILAI.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project2_Balikkalimat: Project2_Balikkalimat.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project3_Rerata: Project3_Rerata.cpp count.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project4_KonversiJarak: Project4_KonversiJarak.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project5_UangPecahan: Project5_UangPecahan.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project6_KonversiWaktu: Project6_KonversiWaktu.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project7_KonversiAngka: Project7_KonversiAngka.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project8_Fifa: Project8_Fifa.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project9_Luasdanvolume: Project9_Luasdanvolume.cpp count.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project10_Warna: Project10_Warna.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project11_Eskrim: Project11_Eskrim.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project12_VendingMesin: Project12_VendingMesin.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project13_IsiPulsa: Project13_IsiPulsa.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project14_TiketBioskop: Project14_TiketBioskop.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

Project15_Awm: Project15_Awm.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $<

# Phony targets
.PHONY: clean
clean:
	rm -f $(TARGETS) $(OBJECTS) *.o

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all          - Build all projects (default)"
	@echo "  clean        - Remove all compiled files"
	@echo "  help         - Display this help message"
	@echo ""
	@echo "Individual projects:"
	@for target in $(TARGETS); do echo "  $$target"; done