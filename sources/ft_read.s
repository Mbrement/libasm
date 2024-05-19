[BITS 64]  ;to assemble in 64 bits

extern __errno_location

global _ft_read
section .text

_ft_read :

	push rbp
	mov rbp, rsp

	mov rax, 0
	syscall
	test rax, rax
	js _error
	jmp _end


	

_error :
	neg rax
	mov rdi, rax

	call  [rel __errno_location wrt ..got]  ;WOODOO MAGIC
	mov [rax], rdi
	mov rax, -1
	jmp _end

_end :
	
	mov rsp, rbp
	pop rbp
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
