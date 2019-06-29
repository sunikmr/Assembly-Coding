;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Print Even Numbers from 0 to 100;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	mov ebp, esp

	mov ecx, [x]		;intialize ecx=1

loop:
	
	mov eax, ecx		;eax = ecx
	test eax, 1
	jz print 			;Jump on Zero to print
	inc ecx				;ecx++
	cmp ecx, 100		;Compare 
	jle loop			;Jump to loop if ecx is less than or equal to 100
	
print:
	push ecx			;Saved ecx as ecx will change when printf fn is called

	mov eax,ecx			;eax=ecx
	push eax			
	push msg2
	call printf
	add esp,8

	pop ecx				;saved ecx is restored
	inc ecx
	cmp ecx, 100
	jle loop
	jmp exit
	


	
exit:					;Epilogue

	mov esp, ebp
	mov eax, 0
	pop ebp
	ret

