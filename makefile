ASM     = nasm
LD      = ld
ASMFLAGS= -f elf32
LDFLAGS = -m elf_i386

EXE     = hello-world
SRC     = hello-world.asm
OBJ     = $(SRC:.asm=.o)
LST     = $(SRC:.asm=.lst)
PREPROC = $(SRC:.asm=.i)

all: $(EXE)

$(OBJ): $(SRC) makefile
	$(ASM) $(ASMFLAGS) $< -o $@ -l $(LST)

$(EXE): $(OBJ)
	$(LD) $(LDFLAGS) $< -o $@

preproc: $(SRC)
	$(ASM) -E $< > $(PREPROC)

run: $(EXE)
	./$(EXE)

clean:
	rm -f $(OBJ) $(EXE) $(LST) $(PREPROC)
