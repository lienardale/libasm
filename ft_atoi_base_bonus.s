section .text
	global _ft_atoi_base
	extern _ft_strlen

_ft_atoi_base:					; rdi = av1 = str; rsi = av2 = base
	cmp		rdi, 0
	je		.err
	cmp		rsi, 0
	je		.err
	push	rdi					; on met la str de cote
	mov		rdi, rsi 			; on met la base dans rdi pour strlen 
	call	_ft_strlen			; on get la len
	mov		r9, rax 			; on store la LEN de base dans R9
	mov		r13, rdi 			; on store la BASE pour la suite dans R13
	pop		r15		 			; on recup la STR qu'on store dans R15
	xor		r10, r10			; on init le RET dans R10
	xor		r14, r14			; on init le NEG dans R14
	xor		rax, rax			; on remet rax a 0
	dec		r13					; on dec la base pour pouvoir loop tranquillement

.check_base:
	inc		r13					; inc de debut de loop
	mov		al, [r13]			; on met le current bit de base dans un tmp
	cmp		al, ' '
	je		.ret
	cmp		al, 9
	je		.ret
	cmp		al, 10
	je		.ret
	cmp		al, 11
	je		.ret
	cmp		al, 12
	je		.ret
	cmp		al, 13
	je		.ret				; si base contient un whitespace, on sort
	cmp		al, '+'
	je		.ret
	cmp		al, '-'
	je		.ret				; si elle contient +/-, on sport
	mov		r12, r13			; on store la BASE dans R12 pour le check doublon
	cmp		al, 0				; si on est pas en fin de base
	jne		.check_doublon		; alors on check les doublons
	dec		r15					; on dec la str pour le loop white space

.space_loop:
	inc		r15					; inc de debut de loop
	mov		al, [r15]			; on met le current bit de str dans un tmp
	cmp		al, ' '
	je		.space_loop
	cmp		al, 9
	je		.space_loop
	cmp		al, 10
	je		.space_loop
	cmp		al, 11
	je		.space_loop
	cmp		al, 12
	je		.space_loop
	cmp		al, 13
	je		.space_loop			; si white_space, on loop
	dec		r15					; sinon, on dec pour le loop +/-

.neg_loop:
	inc		r15					; inc de debut de loop
	cmp		byte[r15], '+'
	je		.neg_loop			; si c'est un +, on loop
	cmp		byte[r15], '-'		; si c'est un -, on modifie le r14 dans .inv avant de loop
	je		.inv				; si aucun des deux, on va dans le loop index

.index_loop:
	xor		rax, rax			; on s'assure aue rax et rbx sont a 0
	xor		rbx, rbx			; ils contiennent bl et al qu'on utilise apres
	mov		bl, byte[rdi] 		; on met le current bit de base dans bl
	mov		al, byte[r15] 		; on met le current bit de str dans al
	cmp		al, 0				; on regarde si *str == '\0'
	je		.ret				; si oui on ret
	cmp		bl, 0				; on regarde si *base == '\0'
	je		.ret				; si oui on ret
	cmp		al, bl				; on compare *str et *base
	je		.atoi_loop			; si cmp renvoie 0, c'est qu'on a trouve l'index
	inc		rdi					; si non, on itere dans base
	jmp		.index_loop			; et on loop

.atoi_loop:
	sub		rdi, rsi			; on soustrait index a base pour avoir l'index en int
	mov		rbx, rdi			; on met l'index dans rbx
	mov		rdi, rsi 			; puis base dams rdi
	imul	r10, r9				; ret = ret * len_base
	add		r10, rbx			; ret = ret + index
	inc		r15					; on itere dans str
	jmp		.index_loop			; on loop

.check_doublon:
	inc		r12					; on inc base pour acceder au next bit
	cmp		byte[r12], 0		; si c'est \0, il n'y aura pas de doublon
	je		.check_base			; donc on ret
	cmp		byte[r12], al		; sinon, on regarde si c'est le current *base
	je		.ret				; si oui, on sort, base invalide
	jmp		.check_doublon		; si non, on loop pour check le reste

.inv:
	cmp		r14, 0				; on check le flag neg
	je		.positive			; si il est a 0 on le passe a 1
	xor		r14, r14			; sinon on le passe a 0
	jmp		.neg_loop			; et on retourne dans le neg_loop

.positive:
	mov		r14, 1				; on passe le flag NEG a 1
	jmp		.neg_loop			; et on retourne dans le neg_loop

.ret:
	mov		rax, r10			; on passe le RET dans le rax
	cmp		r14, 1				; si le flag NEG est a 1
	je		.ret_neg			; on return ret * -1
	ret							; sinon, on return ret

.ret_neg:
	imul	rax, -1				; ret = ret * -1
	ret

.err:
	xor		rax, rax
	ret