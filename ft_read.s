section .text
	global _ft_read

_ft_read:
	mov rax, 0x02000003		; on met read dans la valeur de retour
	syscall					; on l'execute
	jb .err					; si il active les flags d'erreur, on ret -1
	ret						; on ret

.err:
	mov rax, -1
	ret