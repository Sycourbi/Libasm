;ssize_t ft_read(int fd, void *buf, size_t count);
;fd va dans RDI
;buf va dans RSI
;count va dans RDX

section .data
errno_ptr: dq __errno_location      ; pointeur vers la fonction

section .text
    global ft_read
    extern __errno_location

ft_read:
    mov rax, 0  ;Numero syscall read = 0
    syscall     ;Appell systeme

    cmp rax, 0      ;Verifie si retour negatif
    jge .end        ;Si >=0, success retourn rax

    ; sauvegarder le code d'erreur en positif
    neg     rax                     ; erreur en positif
    mov     edi, eax                ; EDI ← int erreur
    mov     rbx, [rel errno_ptr]    ; RBX ← pointeur vers __errno_location
    call    rbx                     ; appel indirect
    mov     [rax], edi              ; *errno = erreur
    mov     rax, -1
    ret

.end:
    ret