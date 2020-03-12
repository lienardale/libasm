section .text
	global _ft_write

_ft_write:
	mov rax, 0x02000004		; on met write dans la valeur de retour
	syscall					; on l'execute
	jb .err					; si il active les flags d'erreur, on ret -1
	ret						; on ret

.err:
	mov rax, -1
	ret