section .text
	global _ft_list_remove_if
	extern _free

_ft_list_remove_if:		;rdi = begin ; rsi = data ; rdx = cmp ; rcx = free
	mov r14, rdi		;on store le begin dans un tmp

.loop:
	mov r11, [r14]		; on met le *begin dans un current 
	cmp r11, 0			; on verifie que le current existe
	je .ret				; si non, on exit

	push rsi
	push rdx			; on save les arg (sauf le rdi) dans rsp
	push rcx			; (on a deja le rdi dans le r14 et on itere dessus)

	mov rdi, [r11]		; on met le current->data dans le 1er arg
	call rdx			; on appelle la fct cmp
	pop rcx
	pop rdx				; on restore les arg
	pop rsi
	cmp rax, 0			; on regarde si current->data = data
	je .replace			; si oui, on remove

	add r11, 8			; si non on accede au current->next
	mov r14, r11		; et on le met dans current

	jmp .loop			; puis on loop

.replace:
	push rsi
	push rdx			; on save les arg
	push rcx
	mov rdi, [r14]		; on met le current dans le 1er arg 
	mov rdi, [rdi]		; on met le current->data dans le 1er arg
	call rcx			; on call la fct de free en arg
	pop rcx
	pop rdx				; on restore les arg
	pop rsi

	mov r12, [r14]		; on met le current dans un tmp
	mov r15, [r14]		; on le met dans un tmp2
	add r15, 8			; sur lequel on itere
	mov r15, [r15]		; r15 = next
	mov [r14], r15		; r14 = prev

	push rsi
	push rdx			; on save les arg
	push rcx
	mov rdi, r12		; on met le maillon dans le 1er arg
	call _free			; on le free
	pop rcx
	pop rdx				; on restore les arg
	pop rsi

	jmp .loop			; on retourne dans le loop

.ret:
	ret