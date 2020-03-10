global _ft_strdup
extern _malloc
extern _ft_strcpy
extern _ft_strlen

section .text

_ft_strdup:
	push rdi
	call _ft_strlen
	mov rdi, rax
	inc rdi
	call _malloc
	je .err
	pop rsi
	mov rdi, rax
	call _ft_strcpy
	ret

.err:
	ret