global _ft_strlen

section .text

_ft_strlen:
		mov		rax, rdi

.strlen_loop:
		mov		r14b, byte [rax]
		cmp		r14b, 0
		je		.end
		inc		rax
		jmp		.strlen_loop

.end:
		sub		rax, rdi
		ret