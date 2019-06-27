section .data
msg1 : db "Enter the Number ",0		
msg2 : db "%d is EVEN",10,0
msg3 : db "%d Number is odd ",10,0
integ times 4 db 0
format : db "%d",0
x: dd 1 ;x=1

section .text
extern scanf
extern printf

global main
main:
	push ebp
	mov ebp,esp

	push msg1
	call printf ;Printing Msg1

	push integ
	push format
	call scanf ;store Integ with user value

	mov eax,[integ]
	test eax,1 ; Checking if the last bit is 1
	jnz .od1

	mov eax,[integ]
	push eax
	push msg2
	call printf
	add esp,8
	jmp .exit

	
.od1:
	mov eax,[integ]
	push eax
	push msg3
	add esp,8
	call printf

.exit:
	mov esp,ebp
	ret 
