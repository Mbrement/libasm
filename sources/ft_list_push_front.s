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

_ft_list_push_front :
	push rbp				
	mov rbp, rsp

	cmp		rdi, 0
	je		_end
	cmp		rsi, 0
	je		_end

	push rdi
	mov rdi, rsi
	call _ft_create_elem			; rax contain the ptr to the new elem
	cmp rax, 0
	je _end
	pop rdi
	mov rsi, [rdi]
	mov   QWORD [rax+8], rsi
	mov [rdi], rax	
	leave
	ret

_end:
	leave
	ret