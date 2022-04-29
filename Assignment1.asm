section .data
str: db "Enter your name:- ", 0xA
len: equ $-str
str2: db "The entered names are:- ", 0xA
len2: equ $-str2

cnt: db 0

section .bss
name: resb 30


section .text
global _start


_start:
	;Printing str
	mov rax, 1
	mov rdi, 1
	mov rsi, str
	mov rdx, len
	syscall
	
	;Taking input from the user
	mov rbx, name
	mov byte[cnt], 0x5
	read:
		mov rax, 0
		mov rdi, 0
		mov rsi, rbx
		mov rdx, 17
		syscall
		add rbx, 17
		dec byte[cnt]
		jnz read
		
	;Printing str2
	mov rax, 1
	mov rdi, 1
	mov rsi, str2
	mov rdx, len2
	syscall
	
	;Printing input from user
	mov rbx, name
	mov byte[cnt], 0x5
	print:
		mov rax, 1
		mov rdi, 1
		mov rsi, rbx
		mov rdx, 17
		syscall
		add rbx, 17
		dec byte[cnt]
		jnz print
		
	mov rax, 60
	mov rdi, 60
	syscall
