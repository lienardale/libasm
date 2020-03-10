global _ft_write

section .text

_ft_write:
	mov rax, 0x02000004
	syscall
	jb .err
	ret

.err:
	mov rax, -1
	ret