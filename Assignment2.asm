section .data

str1: db "Enter the string:- ", 0xA
len1: equ $- str1

cnt: db 0

section .bss
input_str: resb 50
result: resb 50

section .text
global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, str1
	mov rdx, len1
	syscall
	
	mov rax, 0
	mov rdi, 0
	mov rsi, input_str
	mov rdx, 50
	syscall
	
	dec rax
	mov byte[cnt], 0x10
	mov rsi, result
	l1:
		rol rax, 4
		mov bl, al
		and bl, 0x0f
		cmp bl, 0x9
		jbe l2
		add bl, 0x07
		l2:
		
			add bl, 0x30
			mov [rsi], bl
			inc rsi
			dec byte[cnt]
			jnz l1
			
	mov rax, 1
	mov rdi, 1
	mov rsi, result
	mov rdx, 50
	syscall
	
	mov rax, 60
	mov rdi, 00
	syscall
	
