;To find greatest number in an array
section .data

array: dq 0x9045678216894034, 0x1789046738215649, 0x8567934567289123, 0x3904567839873452

cntr: db 3

greatest_num: dq 0x0000000000000000

section .text
global _start

_start:
	mov rsi, array		;Moves the address of array in rsi
	mov rdx, qword[rsi]	;Moves first element of array in rdx
	jmp loop
	
	swap:
		mov rdx, qword[rsi]
		jmp loop2
	
	loop:
		add rsi, 8		;Now rsi points to next element
		mov rax, qword[rsi]	;Next element is moved in accumulator
		sub rax, rdx		;
		jns swap
	
	loop2:
		dec cntr
		jnz loop
		
	mov rax, rdx
	add greatest_num, rax
	add greatest_num, 0x30
	
	mov rax, 1
	mov rdi, 1
	mov rsi, greatest_num
	mov rdx, 1
	syscall
	
	mov rax, 60
	mov rdi, 00
	syscall
	
