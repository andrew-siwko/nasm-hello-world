; hello-world.asm - Prints "Hello, World!" in Linux using x86 assembly

section .data
    msg1 db "Hello, World!", 0x0A  ; String with newline
    len1 equ $ - msg1               ; Length of string
    msg2 db "How did I get here?", 0x0A  ; String with newline
    len2 equ $ - msg2               ; Length of string


section .text
    global _start

_start:
    ; sys_write (stdout=1, msg1, len1)
    mov eax, 4        ; syscall number for sys_write
    mov ebx, 1        ; file descriptor (stdout)
    mov ecx, msg1      ; pointer to message
    mov edx, len1     ; message length
    int 0x80          ; call kernel

    mov eax, 4        ; syscall number for sys_write
    mov ebx, 1        ; file descriptor (stdout)
    mov ecx, msg2      ; pointer to message
    mov edx, len2     ; message length
    int 0x80          ; call kernel

    ; sys_exit (status=0)
    mov eax, 1        ; syscall number for sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80
