section .text
	global _ft_strlen
_ft_strlen:
		mov		rax, rdi			; on met le char * dans le ret

.strlen_loop:
		mov		r14b, byte [rax]	; on met le bit courant dans un tmp
		cmp		r14b, 0				; on regarde si c'est \0
		je		.end				; si oui on ret
		inc		rax					; si non on incremente
		jmp		.strlen_loop		; et on recommence

.end:
		sub		rax, rdi			; on soustrait l'adresse de depart et celle d'arrivee
		ret							; ca donne la len