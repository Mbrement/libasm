[BITS 64]   ;to assemble in 64 bits

global _ft_strlen
section .text

_ft_strlen:

	; this step lose time by creting a new stack frame
	push rbp				; Save the base pointer
	mov rbp, rsp			; Set the base pointer to the current stack pointer

	xor rax, rax			; Initialize the counter to 0
	mov rcx, rdi			; Copy the pointer to the source string into rcx

_loop_start:
	cmp byte [rcx], 0		; Check if the current character is null terminator
	je _loop_end				; If yes, jump to the end of the loop

	inc rax          		; Increment the counter
	inc rcx					; Move to the next character
	jmp _loop_start			; Jump back to the start of the loop

_loop_end:
	mov rsp, rbp			; Restore the stack pointer
	pop rbp					; Restore the base pointer

	ret						; Return the length in rax


section .note.GNU-stack noalloc noexec nowrite progbits
