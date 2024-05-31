BITS 64

global _ft_list_swap
section .text


_ft_list_swap :
	push	rbp				
	mov		rbp, rsp


	mov		r8, rdi
	mov		r9, rsi
	mov		rsi, [r8]
	mov		rdi, [r9]
	mov		[r8], rdi
	mov		[r9], rsi

	leave
	ret


