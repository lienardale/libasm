global _ft_strcmp

section .text

_ft_strcmp:
		mov rax, 0
		mov r15, 0

.strcmp_loop:
		mov		al, [rdi]
		mov		r15b, [rsi]
		cmp		al, r15b
		jne		.end
		cmp		al, 0
		je		.end
		inc		rsi
		inc		rdi
		jmp		.strcmp_loop

.end:
		sub rax, r15
		ret