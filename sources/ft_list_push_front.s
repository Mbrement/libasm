BITS 64


; typedef struct  s_list
; {
; 	void *data;
; 	s_list *next;
; } t_list;
; void _ft_list_push_front(t_list **begin_list, void *data);


global _ft_list_push_front
section .text

	extern _ft_create_elem

ft_list_push_front :
	push rbp				
	mov rbp, rsp
	
	; make a new list element et le mettre dans rax

	call _ft_create_elem

	inc rax
	inc rax
	mov rax, [rdi]
	dec rax
	dec rax

	
	
	leave
	ret
