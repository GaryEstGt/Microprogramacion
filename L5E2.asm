.MODEL small
.stack
.DATA
    enter1 DB ?
.CODE
programa:
    MOV AX,@DATA
    MOV DS,AX
    ;preparar valores para el 
    MOV CL,5
    imprimir:
       MOV AH, 02h
       MOV DL,'X'
       INT 21h
      XOR AX,AX
      MOV AH, 01h
      INT 21h
      CMP AL,13
      JE finalizar
      ADD CL,1
      LOOP imprimir
    
finalizar:
    MOV AH,4Ch
    INT 21h
END programa