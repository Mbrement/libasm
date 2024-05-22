BITS 64

extern _ft_strlen
extern _ft_index

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
	xor r9, r9			;clear rax
	jmp _loop_start

_loop_start :
	cmp byte [rdi], 0
	je _loop_end
	imul r10, r9
	push rdi
	push rsi
	call _ft_index
	pop rsi
	pop rdi
	add r9b, [rax]
	
	inc rdi



	jmp _loop_start

_loop_end :
	
	; mov rax, rdi
	leave
	; mov rsp, rbp
	; pop rbp
	ret


