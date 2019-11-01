.MODEL SMALL
.STACK
.DATA
	mensaje1 DB 10,13,'Ingrese la Cadena:  $'

	mensaje2 DB 10,13,'La cadena es Palidromo$'

	mensaje3 DB 10,13,'La cadena no es Palidromo$'

	nuevo DB 10,13,'$'

	array DB 20 DUP(0)

.CODE    
           
PROGRAMA:
	MOV AX,@DATA
	MOV DS,Ax
	LEA DX,mensaje1
	MOV AH,09H
	INT 21H
	MOV BX,00

ARRIBA:

	MOV AH,01H
	INT 21H
	CMP AL,0DH
	JE ABAJO
	MOV [array+BX],AL
	INC BX
	LOOP ARRIBA
ABAJO:

	MOV DI,0
	DEC BX
	JNZ CHECK
CHECK:

	MOV AL,[array+BX]
	CMP AL,[array+DI]
	JNE FALLO
	INC DI
	DEC BX
	JNZ CHECK
	LEA DX,nuevo
	MOV AH,09H
	INT 21H
	LEA DX,mensaje2
	MOV AH,09H
	INT 21H
	JMP FINAL

FALLO:

	LEA DX,mensaje3
	MOV AH,09H
	INT 21H
FINAL:

	INT 3
	
END PROGRAMA

END