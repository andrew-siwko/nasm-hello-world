%define call_kernel int 0x80

section .data
    msg1        db      "Hello, World!", 0x0A
    len1        equ     $ - msg1             
    msg2        db      "How did I get here?", 0x0A
    len2        equ     $ - msg2               
    sys_write   equ     4
    stdout      equ     1

section .text
    global _start

_start:
    ; sys_write (stdout=1, msg1, len1)
    mov eax, sys_write
    mov ebx, stdout
    mov ecx, msg1      ; pointer to message
    mov edx, len1     ; message length
    call_kernel

    mov eax, sys_write
    mov ebx, stdout
    mov ecx, msg2  
    mov edx, len2  
    call_kernel

    ; sys_exit (status=0)
    mov eax, 1        ; syscall number for sys_exit
    xor ebx, ebx      ; exit code 0
    call_kernel
