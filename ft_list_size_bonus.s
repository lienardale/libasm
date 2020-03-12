section .text
	global _ft_list_size

_ft_list_size:			; rdi = begin [rdi] = data
	mov rax, 0			; init ret value = 0

.loop:
	cmp rdi, 0			; check if current elem exists
	je .ret				; if not, exit
	add rdi, 8			; go to ptr next elem
	inc rax				; ret value ++
	mov rdi, [rdi]		; put ptr next elem in rdi
	jmp .loop			; iterate

.ret:
	ret					; return current ret value