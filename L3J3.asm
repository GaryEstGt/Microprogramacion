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
    
      XOR AX,AX
      MOV AL,num1
      MOV BL,10
      MUL BL
      ADD num2,AL
      MOV BL,1
     Dividir:
     XOR AX,AX
     MOV AL,num2
     DIV BL
     CMP AH,0
     JE imprimirFactor
     Seguir:
     INC BL
     CMP BL,num2
     JG finalizar
     JMP Dividir
    
    ImprimirFactor:
       MOV AH, 02H
       MOV DL,BL
       ADD DL,30h
       INT 21h
       JMP Seguir
    
finalizar:
    MOV AH,4Ch
    INT 21h
END programa