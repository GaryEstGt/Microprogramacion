.MODEL small
.STACK
.DATA
    numero1 DB ?
    numero2 DB ?
    numer DB ?
    decenas DB 10
    array db 8 dup(0)
	arreglo
    sizes db 0
    bin DB 2
.CODE
programa:
    MOV AX, @DATA
    MOV DS, AX
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV numero1, AL
    MOV AH, 01h
    INT 21h
    MOV numero2, AL
    SUB numero1, 30h
    SUB numero2, 30h
   
    MOV AL, numero1
    
    MUL dece
    
    MOV numero1, AL
    
    MOV numer, AL
    MOV AL, numero2
    ADD numer, AL
    
    MOV DL, 10
    MOV AH, 02
    INT 21h
    XOR CX,CX
    MOV CL, numer
    
    factores:
    XOR AX,AX
    MOV AL, numer
    DIV bin
    MOV numer,AL
    MOV DL,AH
    xor bx, bx
    mov bx, offset array   
    XOR AX, AX
    MOV Al, sizes
    add bx,ax               
    mov [bx], dl         
    INC sizes 
    MOV Cl,numer
    CMP numer, 1
    LOOP factores
    
    mov dl,numer
    xor bx, bx
    mov bx, offset array   
    XOR AX, AX
    MOV Al, sizes
    add bx,ax               
    mov [bx], dl            
    
    
    mov cl, sizes
    xor bx, bx
    mov bx, offset array
    add bx, cx
    add cl,1
    imprimir:
    mov dl,[bx]
    cmp dx, ax
    CMP cx,0
    JE finalizar
    sub bx, 1
    XOR AX,AX
    ADD DL,30h
    MOV AH, 02
    INT 21h 
    LOOP imprimir

    finalizar:
    MOV AH, 4Ch
    INT 21h
END programa