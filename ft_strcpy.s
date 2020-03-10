global _ft_strcpy

section .text

_ft_strcpy:
		mov		rax, rdi

.strcpy_loop:
		mov		r14b, [rsi]
		mov		[rdi], r14b
		cmp		r14b, 0
		je		.end
		inc		rdi
		inc		rsi
		jmp		.strcpy_loop

.end:
		ret