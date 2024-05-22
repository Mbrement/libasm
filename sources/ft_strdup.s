[BITS 64]

section .data
	strlen_ptr dq _ft_strlen
	malloc_ptr dq malloc
	strcpy_ptr dq _ft_strcpy

section .text
	global _ft_strdup
	extern _ft_strlen
	extern malloc
	extern _ft_strcpy

_ft_strdup:	
	push rbp
	mov rbp, rsp
	mov r10, rdi
	push r10

	mov rax, [rel strlen_ptr]
	call rax

	mov rdi, rax
	add rdi, 1

	mov rax, [rel malloc_ptr]
	call rax


	pop r10
	mov rdi, rax
	mov rsi, r10

	mov rax, [rel strcpy_ptr]
	call rax

	; mov rsp, rbp
	; pop rbp

	leave
	ret

section .note.GNU-stack progbits
