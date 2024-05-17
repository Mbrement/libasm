[BITS 64]  ;to assemble in 64 bits


extern ft_strlen
extern malloc
extern ft_strcpy

global _ft_strdup
section .text

_ft_strdup :
	push rbp
	mov rbp, rsp

	mov 	r10, rdi
	push 	r10
	call	ft_strlen
	mov 	rdi, rax
	add		rdi, 1
	call	malloc
	pop		r10
	mov		rdi, rax
	mov		rsi, r10
	call	ft_strcpy

	; mov 	rsi, rdi
	; mov		rdi, r10
	; call	extern _ft_strcpy

	


	mov		rsp, rbp
	pop		rbp

	ret	
