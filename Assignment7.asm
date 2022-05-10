;To transfer a block of data in the data segment from source location to the destination using string instructions
section .data
	str1: db "Before transfer",0xA
	len1: equ $-str1
	block1: dq 0x9045678216894034, 0x1789046738215649, 0x8567934567289123, 0x3904567839873452
	cnt: db 16
	
section .bss
	block2: resq 4
	result: db 50
	
section .text
global _start

_start:
	;Printing Before transfer
	mov rax, 1
	mov rdi, 1
	mov rsi, str1
	mov rdx, len1
	syscall
	
	
	mov rsi, block1
	mov cl, 4
	mov rax, rsi
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
	mov rsi,
	mov rdx, len1
	syscall
	
	
