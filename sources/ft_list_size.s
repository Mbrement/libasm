BITS 64


; typedef struct  s_list
; {
; 	void *data;
; 	s_list *next;
; } t_list;
; void _ft_list_push_front(t_list **begin_list, void *data);


global _ft_list_size
section .text


_ft_list_size :
	push	rbp				
	mov		rbp, rsp

	xor		rax, rax
	jmp		loop_start

loop_start :
	inc		rax
	cmp		QWORD [rdi+8], 0
	je		loop_end
	mov		rdi, QWORD [rdi+8]
	jmp		loop_start
	
	
loop_end :
	leave
	ret


