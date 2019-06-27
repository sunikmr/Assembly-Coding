;;;;;;;;;;;;;;;; Fibonacci Series ;;;;;;;;;;;


section .data
x: dd 0
y: dd 1
z: dd 0
message : db "The values are %d ",10,0
message3 : db "The values are %d ",10,0
message1 : db "Enter the value ",10,0
formatin : db "%d",0
input times 4 db 0
iter times 4 db 0

section .bss
;iter:resb 4



section .text
extern printf
extern scanf

global main
main:

	push ebp
	mov ebp,esp

	push message1
	call printf

	push input
	push formatin
	call scanf
	

	mov eax,[x]
	mov ebx,[y]
	mov edx,[z]
	mov byte [iter],1

	mov edx,[input]
	cmp edx,1
	je one
	cmp edx,2
	je two
	cmp edx,2
	jg star

	one:
	push eax
	push message
	call printf
	add esp ,4	
	pop eax
	jmp exit


	two:
	push eax
	push message
	call printf
	add esp ,4	
	pop eax
	push ebx
	push message
	call printf
	add esp ,4	
	pop ebx
	jmp exit

	


star:

	

	mov eax,[x]
	mov ebx,[x]
	mov ecx,[y]
	add eax,ecx
	mov [z],eax
	mov [x],ecx
	mov [y],eax

	
	

	push ebx
	;push eax
	push message3
	call printf
	add esp ,8	
	pop eax
	
	inc byte[iter]
	mov ebx, [input]
	mov edx, [iter]
	cmp edx,ebx
	jle star
	jmp exit
exit:
	mov eax, 0
	mov esp,ebp
	pop ebp
	ret







