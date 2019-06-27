;;;;;;;;;;;;;;;;;;Program to print Biggest of Three Numbers ;;;;;;;;;;;;;;;;;;;;;


section .data
	x: dd 100
	y: dd 11
	z: dd 20
	msg1 : db "X is greater than y and z",10,0
	msg2 : db "Y is greater than x and z",10,0
	msg3: db "Zis greater than x and y",10,0

section .text
extern printf
global main
	main:
		;creation of stack
		push ebp
		mov ebp,esp

		;program
		mov eax, DWORD [x]
		mov ebx, DWORD [y]
		cmp eax,ebx
		jg .Xbig
		mov ecx, DWORD [z]
		cmp ecx,ebx
		jg .Zbig
		push msg2
		call printf 
		jmp .close

		.Xbig:
			mov ecx,DWORD[z]
			cmp eax,ecx
			jl .Zbig
			push msg1
			call printf
			jmp .close

		.Zbig:
			push msg3
			call printf
			jmp .close 


		
	.close:
		; deletion of stack frame
			mov esp,ebp
			pop ebp
			ret
