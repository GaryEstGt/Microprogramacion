.MODEL small
.STACK
.DATA
    num DB ?
    num2 DB ?
    ingresen1 DB 'Ingrese Numero 1$',10
    ingresen2 DB 'Ingrese Numero 2$',10
    igual DB 10,'Son iguales$'
    nmayor DB 10,'numero1 mayor$'
    nmenor DB 10,'numero1 menor$'
.CODE
programa:
    MOV AX,@DATA
    MOV DS,AX
     MOV DX, OFFSET ingresen1
    MOV AH,09h
    INT 21h
    ;Leer num
    XOR AX,AX
    MOV AH,01h
    INT 21h
    MOV CL,AL
    SUB CL,30h
    
     MOV DX, OFFSET ingresen2
    MOV AH,09h
    INT 21h
    ;Leer num
    XOR AX,AX
    MOV AH,01h
    INT 21h
    MOV num2,AL
    SUB num2,30h
    
    CMP CL,num2
    JE sonigual
    CMP CL,num2
    JG nmayore
    CMP CL,num2
    JL nmenore
    JMP finalizar
    
    sonigual:
    MOV DX, OFFSET igual
    MOV AH,09h
    INT 21h
    JMP finalizar
    
    nmayore:
    MOV DX, OFFSET nmayor
    MOV AH,09h
    INT 21h
    JMP finalizar
    
    nmenore:
    MOV DX, OFFSET nmenor
    MOV AH,09h
    INT 21h
    JMP finalizar
    

 finalizar:
    ;finalizar
    MOV AH, 4Ch
    INT 21h
End programa