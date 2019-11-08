.386
.model flat, stdcall
option casemap:none
; Includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc 
; librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
; Segmento de Datos
.DATA  
hola DB "Ingrese Numero",0
suma DB "suma ",0
resta DB "resta ",0
mayor DB "es mayor ",0
igual DB "son iguales",0
ingreso1 DB 0,0
ingreso2 DB 0,0
num1 DB 1,0
num2 DB 1,0
comp1 DB 1,0
comp2 DB 1,0
.DATA?
leer DB 50 dup(?)
; codigo
.CODE 
 
programa:
main PROC
	; imprimir cadena
	INVOKE StdOut, addr hola
	; pedir numero
invoke StdOut, addr ingreso1
	invoke StdIn, addr num1, 10
	invoke atodw, addr num1	
	SUB num1,30h
INVOKE StdOut, addr hola
; pedir numero
invoke StdOut, addr ingreso2
	invoke StdIn, addr num2, 10
	invoke atodw, addr num2
	SUB num2,30h
	XOR AX,AX
	XOR CL,CL
	MOV AL,num1
	MOV CL,num2
	MOV comp1,AL
	MOV comp2,CL
	MOV BL,comp1
	CMP BL,comp2
	JE sonIguales
	JG mayor1
	JP mayor2
	Regreso:
	XOR AX,AX
	XOR CL,CL
	MOV AL,num1
	MOV CL,num1
	ADD AL,num2
	SUB CL,num2
	MOV num1,AL
	MOV num2,CL
	ADD num2,30h
	ADD num1, 30h
INVOKE StdOut, addr suma
	INVOKE StdOut, addr num1
INVOKE StdOut, addr resta	
	INVOKE StdOut, addr num2
JMP final

	mayor1:

	ADD comp1, 30h
INVOKE StdOut, addr mayor
	INVOKE StdOut, addr comp1
	JMP Regreso
mayor2:
ADD comp2,30h
INVOKE StdOut, addr mayor
	INVOKE StdOut, addr comp2
	JMP Regreso
sonIguales:
INVOKE StdOut, addr igual
	JMP Regreso
	; finalizar
final:
	INVOKE ExitProcess,0
	main ENDP
END programa