[register] -> dereference a register
rax = return value
rdi = first parameter
rsi = second
rdx = third
byte = only a byte


rsp = stack pointer 
rbp = register reserved save the stack pointer

sequence :
	push rbp				
	mov rbp, rsp

	; code

	mov rsp, rbp				; can be both replace by a single leave instruction
	pop rbp						;
	ret
----------------------
	create a new stack and return to the first after




instruction :

mov destination source
	mov = copy source to destination
	movsx = move 1 byte	

j are generaly a jump
je = jump if equal (if last instruction is true)
jne = jump is not equal
jmp = jump


Other :

[BIT 64] = to assemble in 64 bits
