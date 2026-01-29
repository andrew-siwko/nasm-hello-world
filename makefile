ASM     = nasm
LD      = ld
ASMFLAGS= -f elf32
LDFLAGS = -m elf_i386

TARGET  = hello-world
SRC     = hello-world.asm
OBJ     = $(SRC:.asm=.o)

all: $(TARGET)

$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) $< -o $@

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) $< -o $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
