section .text
	global _ft_list_sort

_ft_list_sort:
	push		rdi				; allignement de la stack
	mov			rdi, [rdi]		; on met *begin dans current
	cmp			rdi, 0			; on verifie qu'il n'est pas null
	je			.ret			; si il l'est, on quitte
	mov			r12, rsi		; on save la fct a part
	mov			r13, 0			; on met un tmp a 0

.parent_loop:
	pop			rdi				; recuperation *begin
	push		rdi				; allignement de la stack
	mov			rdi, [rdi]		; on remet *begin dans current
	cmp			r13, 0			; on regarde si tmp est a zero
	jne			.ret			; si non on return
	inc			r13				; si oui on le met a 1 et on passe au child_loop

.child_loop:
	mov			rsi, [rdi + 8]	; rdi = curent, rsi = next 
	cmp			rsi, 0			; on verif que rsi n'est pas null
	je			.parent_loop	; si il l'est, on retourne dans le parent_loop
	push		rsi				; on save les elements
	push		rdi
	mov			rsi, [rsi]		; les params de cmp sont les char *data
	mov			rdi, [rdi]
	call		r12				; on appelle cmp
	pop			rsi				; on recup les arg
	pop			rdi				
	cmp			rax, 0			; on compare ret de cmp a 0 
	jle			.child_loop		; si il est inferieur ou egal a 0, on boucle
	mov			r14, [rsi]		; sinon, on swap
	mov			r15, [rdi]
	mov			[rdi], r14		
	mov			[rsi], r15
	mov			r13, 0			; on remet le tmp a 0, quand il n'aura plus rien a swap il restera a 1
	jmp			.child_loop		; puis on boucle

.ret:
	pop			rdi				; on remet la stack dans son etat initial
	ret