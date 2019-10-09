.MODEL small
.STACK
.DATA
    num DB ?
    espar DB 'Es par$'
    noespar DB 'NO Es par$'
    residuo DB ?
.CODE
programa:
    MOV AX,@DATA
    MOV DS,AX
    ;Leer num
    XOR AX,AX
    MOV AH,01h
    INT 21h
    MOV num,AL
    SUB num,30h
    ;comparar si es par
    XOR AX,AX
    MOV AL,num
    MOV CL,2
    DIV CL
    ;residuo ah
    MOV residuo,AH
    ;comparar
    CMP residuo,0
    JE imprimirespar
    JMP imprimiresimpar
    
    imprimiresimpar:
    MOV DX, OFFSET noespar
    MOV AH,09h
    INT 21h
    JMP finalizar
    
    imprimirespar:
    MOV DX, OFFSET espar
    MOV AH,09h
    INT 21h
    
    
    finalizar:
    ;finalizar
    MOV AH, 4Ch
    INT 21h
end programa