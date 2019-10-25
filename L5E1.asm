.MODEL small
.stack
.DATA
    num1 DB ?
    num2 DB ?
.CODE
programa:
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    MOV AH, 01h
    INT 21h
    MOV num1,AL
    
    XOR AX,AX
    MOV AH, 01h
    INT 21h
    MOV num2,AL
    
    SUB num1,30h
    SUB num2,30h
    ;preparar valores para el ciclo
    MOV CL,num2
    SUB CL,1
    MOV BL,num1
   Multiplicar:
   ADD BL,num1 
   LOOP Multiplicar
   
   Imprimir:
    ;limpiar pantalla 
    MOV AH,00h 
    MOV AL,03h
    INT 10h
      
   ADD BL,30h
   MOV AH, 02h
   MOV DL,BL
   INT 21h
    
finalizar:
    MOV AH,4Ch
    INT 21h
END programa