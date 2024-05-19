BITS 64

global _ft_atoi_base
section .text

_ft_atoi_base:
	push rbp				
	mov rbp, rsp


	mov rsp, rbp
	pop rbp
	ret