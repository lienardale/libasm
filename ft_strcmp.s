section .text
	global _ft_strcmp

_ft_strcmp:
		mov rax, 0				; on met la val de ret a 0 par defaut
		mov r15, 0				; on init un tmp a 0

.strcmp_loop:
		mov		al, [rdi]		; on met le 1er bit de s1 dans un tmp
		mov		r15b, [rsi]		; et le 1er bit de s2 dans un tmp2
		cmp		al, r15b		; on les compare
		jne		.end			; si ils sont differents on ret
		cmp		al, 0			; on regarde si on est a la fin de s1
		je		.end			; si oui on ret
		inc		rsi				; si non on inc l'addresse de s1
		inc		rdi				; et de s2
		jmp		.strcmp_loop	; et on recommence

.end:
		sub rax, r15			; on soustrait la valeur de s2 a la valeur de retour initiale
		ret						; et on return le tout