

section .data

maincount: db 5h

negcount: db 0
poscount: db 0

str1: db "The negative numbers are:" 
len1: equ $-str1

str2: db "The positive numbers are:" 
len2: equ $-str2

array :dq 0x9045678216894034, 0x1789046738215649, 0x8567934567289123, 0x3904567839873452, 0x7890564372890345


section .text
global _start

_start:

	mov rsi, array    ;Address of array is moved in rsi register
	
	mainLoop:
		mov rax, qword[rsi]    ;Value at address stored in rsi register is moved in rax register
		BT rax, 63        ;Check the 63 bit of register rax which is sign bit
		jc negative      ;If carry is produced the number is negative
		
	postive:
		;inc rbx     ;If carry not produced th no. is positive
		inc byte[poscount]
		jmp arrayLoop
		
	negative:
		 ;increment the count of negative number
		inc byte[negcount]
			
	arrayLoop:
		add rsi, 8    ;Incresing the address in array by 8 bits for next address location
		dec byte[maincount]  ;decrement the maincount
		jnz mainLoop
		
	
	add byte[negcount], 30h
	
	mov rax,1     ;system call for write
	mov rdi,1
	mov rsi,str1
	mov rdx,len1
	syscall
	
	mov rax,1     ;system call for write
	mov rdi,1
	mov rsi,negcount
	mov rdx,1
	syscall
	 
	add byte[poscount], 30h
	
	mov rax,1     ;system call for write
	mov rdi,1
	mov rsi,str2
	mov rdx,len2
	syscall
	
	mov rax,1     ;system call for write
	mov rdi,1
	mov rsi,poscount
	mov rdx,1
	syscall
	 	
		
	mov rax, 60
	mov rdi,00
	syscall
		
		
		
		
		
		
		
		
