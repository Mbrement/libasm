[BITS 64]  ;to assemble in 64 bits

global _ft_index
section .text

_ft_index :

	push rbp				;create stackframe
	mov rbp, rsp			;save base pointer
	xor rax, rax			;set rax to 0
	mov	r8b, [rdi]
	
_loop_start :

	cmp byte [rsi], 0
	je _loop_end_2
	cmp r8b, byte [rsi]
	je _loop_end
	inc rsi
	inc rax
	jmp _loop_start

_loop_end :
	leave
	ret	

_loop_end_2:
	mov rax, -1
	leave
	ret

section .note.GNU-stack progbits