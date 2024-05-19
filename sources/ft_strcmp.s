[BITS 64]  ;to assemble in 64 bits

global _ft_strcmp
section .text

_ft_strcmp :

	push rbp				;create stackframe
	mov rbp, rsp			;save base pointer
	xor rax, rax			;set rax to 0
	
_loop_start :

	mov	r8b, [rdi]
	mov r9b, [rsi]
	cmp r8b, 0
	je _loop_end
	cmp r9b, 0
	je _loop_end
	cmp r8b, r9b
	jne _loop_end
	inc rdi
	inc rsi
	jmp _loop_start

_loop_end :
	sub r8b, r9b
	movsx rax, r8b
	mov rsp, rbp					; Restore the stack pointer
	pop rbp							; Restore the base pointer
	ret		
					
section .note.GNU-stack noalloc noexec nowrite progbits