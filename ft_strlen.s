;size_t ft_strlen(const char *s)
; *s va dans le registre rdi car 1er argument.

section .text
	global ft_strlen    ; rend la fonction lisible a l'editeur de lien

ft_strlen:
	xor		rax,rax		; RAX = 0 comteur de caractere

.loop:
	cmp	byte [rdi + rax], 0  ; compare le caractere avec /0
	je .done  					 ;Si je suis sur /0 aller a .done
	inc	rax  					 ;incrementation du compteur
	jmp		.loop				 ;relance la boucle

.done:
	ret		;Retourn la valeur dans rax