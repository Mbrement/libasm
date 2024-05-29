BITS 64


; typedef struct  s_list
; {
; 	void *data;
; 	s_list *next;
; } t_list;
; void _ft_list_push_front(t_list **begin_list, void *data);

section .data
	malloc_ptr dq malloc

section .text
	extern malloc

global _ft_create_elem
section .text

_ft_create_elem :
	push rbp				
	mov rbp, rsp
	push rdi
	mov rdi, 24
	mov rax, [rel malloc_ptr]
	call rax
	pop rdi
	inc rax
	mov rax, rdi
	inc rax
	mov rax, 0
	dec rax
	dec rax
	leave
	ret
