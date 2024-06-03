BITS 64


; typedef struct  s_list
; {
; 	void *data;
; 	s_list *next;
; } t_list;
; void _ft_list_push_front(t_list **begin_list, void *data);


global _ft_list_sort

section .text
extern _ft_list_swap
extern _ft_list_exec


_ft_list_sort :
	push	rbp
	mov		rbp, rsp

	xor		rax, rax
	cmp		QWORD [rdi], 0
	je		_loop_end
	mov		rdi, [rdi]
	cmp		QWORD [rdi+8], 0
	je		_loop_end
	cmp		QWORD [rsi], 0
	je		_loop_end
	mov		r8, rdi			;begin_list
	mov		r9, rsi			;cmp function	
	jmp		_init_loop


_loop_end :
	leave
	ret

_init_loop :
	cmp		QWORD [rdi], 0
	je		_loop_end
	mov		rdi, r8
	jmp		_loop_start

_loop_start :
	cmp		rdi, 0
	je		_loop_end
	cmp		QWORD [rdi+8], 0
	je		_loop_end
	push	rdi
	mov		rsi, [rdi+8]
	push	rsi
 	mov		rdi, [rdi]
	mov		rsi, [rsi]
	; ;mov		rdx, r9
	call	r9
	pop		rsi
	pop		rdi
	cmp		rax, 0
	jge		_swap
	mov		rdi, QWORD [rdi+8]
	jmp		_loop_end



_swap :
	push 	r12
	mov		r11, rdi
	mov		r12, rsi
	mov		rsi, [r11]
	mov		rdi, [r12]
	mov		[r11], rdi
	mov		[r12], rsi
	pop		r12
	jmp		_init_loop



