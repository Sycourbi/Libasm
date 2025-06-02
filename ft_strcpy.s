;char *ft_strcpy(char *dest, const char *src)
;dest va dans RDI (1er argument)
;src va dans RSI (2eme argument)
;retourne RAX = adresse de dst

section .text
    global ft_strcpy        ;Rend accessible depuis le main.c

ft_strcpy:
    mov rax, rdi            ;Sauvegarde dans RAX l'adresse de RDI

.copy_loop:
    mov cl, byte [rsi]          ;copie le caractere de rsi(src) dans cl
    mov byte [rdi], cl          ;copie le caractere al dans rdi(dst) 
    inc rsi                     ;avance sur RSI
    inc rdi                     ;avance sur RDI
    test cl, cl                 ;verifie si /0 copier
    jnz .copy_loop              ;Jump if not zero  si pas /0 cotinue

    ret             ;Retourne l'adresse de dst