[BITS 64]  ;to assemble in 64 bits

global _ft_strcpy
section .text

_ft_strcpy :
    	; this step lose time by creting a new stack frame
	push rbp				; Save the base pointer
	mov rbp, rsp			; Set the base pointer to the current stack pointer
	mov rax, rdi
	
loop_start :
	cmp byte [rsi], 0
	je loop_end	

	mov r8b, [rsi]					; Load the byte from the source string
	mov [rdi], r8b					; Store the byte in the destination string
	inc rdi							
	inc rsi
	jmp loop_start

loop_end :
	mov byte [rdi], 0				; Null-terminate the destination string
	mov rsp, rbp					; Restore the stack pointer
	pop rbp							; Restore the base pointer
	ret						
