[BITS 64]  ;to assemble in 64 bits

global _ft_strcpy
section .text

_ft_strcpy :
    	; this step lose time by creting a new stack frame
	push rbp				; Save the base pointer
	mov rbp, rsp			; Set the base pointer to the current stack pointer
	mov rax, rdi
	cmp rsi, 0
	je _end
	cmp rdi, 0
	je _end
	
_loop_start :
	cmp byte [rsi], 0
	je _loop_end	

	mov r8b, [rsi]					; Load the byte from the source string
	mov [rdi], r8b					; Store the byte in the destination string
	add rdi, 1							
	add rsi, 1
	jmp _loop_start

_loop_end :
	mov byte [rdi], 0				; Null-terminate the destination string
	; mov rsp, rbp					; Restore the stack pointer
	; pop rbp							; Restore the base pointer
	leave
	ret		
				
_end :
	leave
	ret

section .note.GNU-stack progbits
