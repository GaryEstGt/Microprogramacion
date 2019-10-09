.MODEL small
.STACK
.DATA
    num DB ?
    num2 DB ?
    incremento DB 1
    contadorResta DB 0
    ingresen1 DB 'Ingrese Numero 1$',10
    ingresen2 DB 'Ingrese Numero 2$',10
    producto DB 10,'Producto$'
    cociente DB 10,'Cociente$'
    residuo DB'Residuo$'
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
    MOV BL,AL
    SUB BL,30h
    
     MOV DX, OFFSET ingresen2
    MOV AH,09h
    INT 21h
    ;Leer num
    XOR AX,AX
    MOV AH,01h
    INT 21h
    MOV num2,AL
    SUB num2,30h
    MOV CL,num2
    ciclo:
    ADD num2,CL
    INC incremento
    CMP incremento,BL
    JE ciclo2
    JMP ciclo
    
    ciclo2:
    SUB BL,CL
    INC contadorResta
    CMP BL,CL
    JL mostrar
    JMP ciclo2
    
    mostrar:
    MOV DX, OFFSET producto
    MOV AH,09h
    INT 21h
    ADD num2,30h
    MOV DL,num2
    Mov AH,02   
    Int 21h    ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    MOV DX, OFFSET cociente
    MOV AH,09h
    INT 21h
    ADD contadorResta,30h
    MOV DL,contadorResta
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h
    
     MOV DX, OFFSET residuo
    MOV AH,09h
    INT 21h
    ADD BL,30h
    MOV DL,BL
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h
    JMP finalizar
    

 finalizar:
    ;finalizar
    MOV AH, 4Ch
    INT 21h
End programa