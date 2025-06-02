;int ft_strcmp(const char *s1, const char *s2);
;s1 va dans RDI(1er argument)
;s2 va dans RSI(2eme argument)
;returne nombre positif ou negatif RAX = (s1 - s2)

section .text
	global  ft_strcmp

ft_strcmp:
.loop:
	mov	al, byte [rdi] ;Met dans al le caractere de RDi
	mov	bl, byte [rsi] ;Met dans bl le caractere de RSI
	cmp al, bl ;Compare les caractere
	jne	.diff ;"Jump if not equal" Si different on va a la fonction diff
	test	al, al ;Verifie si on est a la fin
	je	.equal ;Si /o fin equalite retourne 0
	inc	rdi ;Avance dans RDI
	inc	rsi ;Avance dans RSI;
	jmp	.loop ;Recommence la boucle

.diff:
	movzx eax, al ;Mettre al en non signer dans eax
	movzx ebx, bl ;mettre bl en non signer dans ebx
	sub	eax, ebx ;soustraction
	ret

.equal:
	xor		eax, eax ;Retourne 0 car egal
	ret