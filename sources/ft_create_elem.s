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
	mov rdi, 16
	mov rax, [rel malloc_ptr]
	call rax
	pop rdi
	cmp rax, 0
	je  _error
	mov   [rax], rdi
	mov   QWORD [rax+8], 0x0
	leave
	ret

_error:
	mov rax, 0
	ret