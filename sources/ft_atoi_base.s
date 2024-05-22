BITS 64

extern _ft_strlen

global _ft_atoi_base
section .text

_ft_atoi_base:
	push rbp				
	mov rbp, rsp

	xor rcx, rcx
	push rdi
	mov rdi, rsi
	call _ft_strlen
	pop rdi
	mov r10, rax			;save strlen from rdi
	jmp _loop_start

_loop_start :
	cmp byte [rdi], 0
	je _loop_end

	; jmp _loop_extra
	add rdi, 1

	jmp _loop_start

_loop_end :
	mov rsp, rbp
	pop rbp
	ret

_loop_extra :
