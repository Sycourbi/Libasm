;char *ft_strdup(const char *s);
;s va dans RDI

section .data
malloc_ptr: dq malloc

section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    mov r12, rdi        ;Sauvegarde de s
    call    ft_strlen   ;retour de strlen est dans RAX

    inc rax                         ;Ajoute 1 pour le /0
    mov rdi, rax                    ;Preparation pour malloc
    mov rax, [rel malloc_ptr]       ;rax ← pointeur vers malloc
    call    rax                     ; malloc(size)

    test rax, rax       ;Verifie si malloc a fonctionner
    je  .fail           ;Si rax = 0 retour NULL

    mov rsi, r12        ;remettre l'adresse source dans RSI
    mov rdi, rax        ;destination = retour de malloc

    call ft_strcpy      ;copie
    ret                 ;reour rax qui est le pointeur sur l'adresse mallo

.fail:
    xor rax, rax        ;Retourne NULL (RAX = 0)
    ret