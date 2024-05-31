BITS 64

extern _ft_strlen
extern _ft_index

global _ft_atoi_base
section .text

_ft_atoi_base:
	push rbp				
	mov rbp, rsp

	xor rcx, rcx
	cmp		rdi, 0
	je		_loop_end
	cmp		rsi, 0
	je		_loop_end
	push rdi
	mov rdi, rsi
	call _ft_strlen
	pop rdi
	mov r10, rax			;save strlen from rdi
	cmp r10, 0
	je _loop_end_2
	cmp r10, 1
	je _loop_end_2
	xor r9, r9				;clear r9
	jmp _loop_error_base

_loop_start :
	cmp byte [rdi], 0
	je _loop_end

	imul r9, r10
	push rdi
	push rsi
	call _ft_index
	pop rsi
	pop rdi
	cmp rax, -1
	je _loop_end
	add r9, rax
	inc rdi
	jmp _loop_start

_loop_end :
	
	mov rax, 1
	and r11, 1
	jz _loop_end_3
	mov rax, r9
	mov r9, -1
	mul r9
	leave
	ret


_loop_end_2 :
	
	mov rax, 0
	leave
	; mov rsp, rbp
	; pop rbp
	ret

_loop_end_3 :
	mov rax, r9
	leave
	ret

_loop_init :
	sub rsi, r9
	xor r9, r9
	xor r11, r11
	xor rax, rax
	dec rdi
	jmp _skip_space

_skip_space :
	inc rdi
	cmp byte [rdi], ' '
	je _skip_space
	dec rdi
	jmp _loop_skip

_loop_skip :
	inc rdi
	cmp byte [rdi], '+'
	je _loop_skip
	cmp byte [rdi], '-'
	je _dec_11
	jmp _loop_start

_dec_11 :
	inc r11
	jmp _loop_skip

_loop_error_base :
	cmp byte [rsi], 0
	je _loop_init
	cmp byte [rsi], '-'
	je _loop_end_2
	cmp byte [rsi], '+'
	je _loop_end_2
	cmp byte [rsi], 0x20
	je _loop_end_2
	cmp byte [rsi], 0x0D
	je _loop_end_2
	cmp byte [rsi], 0x09
	je _loop_end_2
	cmp byte [rsi], 0x0A
	je _loop_end_2
	push rdi
	push rsi
	mov rdi, rsi
	inc rsi
	call _ft_index
	pop rsi
	pop rdi
	cmp rax, -1
	jne _loop_end_2
	inc rsi
	inc r9
	jmp _loop_error_base

