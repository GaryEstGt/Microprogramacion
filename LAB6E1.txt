.model small
.stack 
.data 
	Ingresar db 10,13,7, 'Ingresar Cadena: ','$'
	firstword db 10,13," firstword : " 
	arregloCadena db 100 dup(' '), '$' 
	
	minus db 10,13,"Mayusculas: $" 
.code 
	mov ax,@data 
	mov ds,ax 
	mov ah, 09h
	lea dx, Ingresar
	int 21h
	
	MOV AH, 3fH
	MOV BX, 00
	MOV CX, 100
	MOV DX, offset[arregloCadena]
	int 21h

	mov ah, 09h
	mov dx, offset[arregloCadena]
	int 21h

	lea dx,firstword 
	mov ah,9 
	int 21h 

	
	lea dx,minus 
	mov ah,9 
	int 21h 

	call conversion

	mov ah,4ch 
	int 21h 


conversion proc 
	mov si,0 
otroMinus: 
	mov al,arregloCadena[si] 
	cmp al,'$' 
	jz finMinus 
	cmp al,'z' 
	jg keepMinus 
	cmp al,'a' 
	jl keepMinus 
	sub al,20H 
keepMinus:
	mov dl,al 
	mov ah,2 
	int 21h 
	inc si 
	jmp otroMinus 
finMinus: ret 
conversion endp 
end