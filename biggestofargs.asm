section .data
msg1 : db "The biggest of arguments is %d",10,0
msge : db "Both are equal",10,0
x : dd 0
y : dd 0

section .text
extern printf 
extern atoi

global main
main:
	
	
	mov edx, [esp+8]  ;Arg starts here
	add edx, 4 ; Skip first arg[filename]

	push edx


	push dword [edx]
	call atoi
	add esp,4
	mov [x],eax


	
	pop edx
	add edx, 4

	push dword[edx]
	call atoi
	add esp,4
	mov [y],eax
	


	;mov eax,dword[x]
	;mov ebx,dword[y]
	cmp eax,[x]
	
	jg printg
	jl printl
	je printe
	
	;push ebx
	;push msg1
	;call printf
	;jmp exit

printg:
	push eax
	push msg1
	call printf
	add esp,8
	jmp exit
printl:
	push dword[x]
	push msg1
	call printf
	add esp,8
	jmp exit

printe:
	
	push msge
	call printf
	add esp,4
	jmp exit


exit:
	leave
	ret
