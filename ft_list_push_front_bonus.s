section .text
	global _ft_list_push_front
	extern _malloc

_ft_list_push_front:			; rdi = begin ; rsi = data
	push rdi					; on save rdi
	push rsi					; on save rsi
	mov rdi, 16					; on set rdi pour malloc
	call _malloc				; on malloc
	cmp rax, 0					; on check si ca a bien malloc
	je .ret						; si non, on ret
	pop rsi						; on recupere le rsi du debut
	pop rdi						; on recupere le rdi du debut
	mov r14, [rdi]				; on met begin dans un registre tampon
	mov [rax], rsi				; On store data dans rax
	mov [rdi], rax				; On remplace begin par le nouvel element
	add rax, 8					; On avance de 8 pour passer sur next
	mov [rax], r14				; set le next

.ret:
	ret					; return current ret value