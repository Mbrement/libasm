BITS 64


; typedef struct  s_list
; {
; 	void *data;
; 	s_list *next;
; } t_list;
; void _ft_list_push_front(t_list **begin_list, void *data);


global _ft_list_exec
section .text


_ft_list_exec :
	push	rbp				
	mov		rbp, rsp

	xor		rax, rax

	call rdx
	leave
	ret


