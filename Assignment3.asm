;To check if the numbers are negative or positive
section  .data

block: dq 0x9045678216894034, 0x1789046738215649, 0x8567934567289123, 0x3904567839873452

str1: db "The negative numbers are ", 0xA
len1: equ $- str1

str2: db "The positive numbers are ", 0xA
len2: equ $- str2

pos: db 0
neg: db 0

cntr: db 4

section .text
global _start

_start:
	mov rsi, block  ;Address of block is moved into the rsi register
	loop:
		mov rax, qword[rsi]  ;Value at address stored in rsi register is moved in rax register
		BT rax, 63 	     ;Check the 63rd bit of register rax which is sign bit
		jc negative          ;If carry is set jump to negative_num label
		inc byte[pos]	     ;If carry is not set then increase number of positive numbers
		jmp loop2
		
	negative:
		inc byte[neg]	     ;Increase number of negative numbers
		
	loop2:
		add rsi, 8	     ;Increase the address in array by 8 bits for next element
		dec byte[cntr]
		jnz loop
		
	add byte[neg], 30h
	
	mov rax, 1
	mov rdi, 1
	mov rsi, str1
	mov rdx, len1
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, neg
	mov rdx, 1
	syscall
	
	add byte[pos], 30h
	
	mov rax, 1
	mov rdi, 1
	mov rsi, str2
	mov rdx, len2
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, pos
	mov rdx, 1
	syscall
	
	mov rax, 60
	mov rdi, 00
	syscall
