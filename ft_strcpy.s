section .text
	global _ft_strcpy

_ft_strcpy:
		mov		rax, rdi			; on met directement la dst dans la val de ret

.strcpy_loop:
		mov		r14b, [rsi]			; on store le 1er bit de src dans un tmp
		mov		[rdi], r14b			; on met ce bit dans dst
		cmp		r14b, 0				; on verifie si ce bit etait le \0
		je		.end				; si oui on ret
		inc		rdi					; si non on inc l'adresse de dst
		inc		rsi					; et de rsc
		jmp		.strcpy_loop		; et on recommence

.end:
		ret