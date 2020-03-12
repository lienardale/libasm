section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strcpy
	extern _ft_strlen

_ft_strdup:
	push	rdi				; on push le char *src
	call	_ft_strlen		; on call strlen sur le char* en av1
	mov		rdi, rax		; on met la val de ret en arg 
	inc		rdi				; on fait +1 pour le \0
	call	_malloc			; on call malloc
	je		.err			; si renvoie null,return
	pop		rsi				; on recupere le char *src qu'on met en av2/rc
	mov		rdi, rax		; on met le return de malloc en av1/dst
	call	_ft_strcpy		; on copie src dans dst
	ret						; on ret

.err:
	ret