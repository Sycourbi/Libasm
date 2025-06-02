;ssize_t ft_write(int fd, const void *buf, size_t count);
;fd va dans RDi
;buf va dans RSI
;Retourn syscall dans RAX
;count va dans RDX

section .data
errno_ptr: dq __errno_location      ; pointeur vers la fonction

section .text
    global ft_write
    extern __errno_location

ft_write:
    mov rax, 1      ;Syscall numero 1 = write
    syscall         ;Appel fonction write linux

    cmp rax, 0        ;Verifie si retourne une erreur
    jge .end          ;Si pas d'erreur returne rax

    ; sauvegarder le code d'erreur en positif
     neg     rax                     ; erreur en positif
    mov     edi, eax                ; EDI ← int erreur
    mov     rbx, [rel errno_ptr]    ; RBX ← pointeur vers __errno_location
    call    rbx                     ; appel indirect
    mov     [rax], edi              ; *errno = erreur
    mov     rax, -1
    ret
    
.end:
    ret                         ;Retourne la valeur de RAX