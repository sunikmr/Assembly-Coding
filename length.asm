section .data
	msg: db "Hello Sunil!",10,0
	msgLen: equ $ -msg
	pri : db "Text size is %d",10,0


section .text
extern printf
global main
	main:
		push ebp
		mov ebp,esp	

		push msg
		call printf
		push msgLen
		push pri
		call printf




		mov esp,ebp
		pop ebp
		ret
