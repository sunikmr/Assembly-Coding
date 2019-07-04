section .data
msg : db "Enter two numbers :",0
cin : db "%d%d",0
integ1 times 4 db 0
integ2 times 4 db 0
mult : db "The result of multiplication %d",10,0
divi : db "The result of division where Quotient is %d and reminder is %d",10,0

extern printf
extern scanf


section .text

global main
main:
	push ebp 
	mov ebp,esp

	;;;;;;;;Get user input;;;;;;;;;;
	
	push msg
	call printf
	add esp,4

	push integ2
	push integ1
	push cin 
	call scanf
	add esp,8
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;; Multiplication ;;;;;;;;

	mov eax, [integ1]
	mov ebx, [integ2]
	mul ebx					; Eax = eax*eax

	push eax
	push mult
	call printf
	add esp,8
	

	;;;;;;;;;; Division ;;;;;;;;;;;;
	
	mov edx,0 				; edx is set to 0 (edx=0)
	mov eax, [integ1]
	mov ebx, [integ2]
	div ebx					; eax = eax/ebx(integer value)

	push edx				; edx stores the reminder value
	push eax
	push divi
	call printf
	add esp,12
	leave 
	ret


	;.exit:

;		leave 
;		ret	

