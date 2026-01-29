; hello-world.asm - Prints "Hello, World!" in Linux using x86 assembly

section .data
    msg db "Hello, World!", 0x0A  ; String with newline
    len equ $ - msg               ; Length of string

section .text
    global _start

_start:
    ; sys_write (stdout=1, msg, len)
    mov eax, 4        ; syscall number for sys_write
    mov ebx, 1        ; file descriptor (stdout)
    mov ecx, msg      ; pointer to message
    mov edx, len      ; message length
    int 0x80          ; call kernel

    ; sys_exit (status=0)
    mov eax, 1        ; syscall number for sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80
