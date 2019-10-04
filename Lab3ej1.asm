.MODEL small
.DATA
; variable que contiene el texto que queremos mostrar
cadena DB 'Suma$'
cadena2 DB 'Resta$'
cadena3 DB 'Multiplicacion$'
cadena4 DB 'division$'
cadena5 DB 'residuo$'
.STACK
.CODE
programa:
    MOV AX,@DATA
    MOV DS, AX
    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    ;Suma
    ; imprimir cadena
    MOV DX,OFFSET cadena ; asignando a DX la variable cadena
    MOV AH, 09h          ; digo que se imprimira una cadena
    INT 21h              ;ejecuta la interrupcion, imprimira
    
    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    
    Mov AL,2h      ; Se asigna el valor a la parte baja del registro AX
    Mov BL,3h      ; Se asigna el valor a la parte baja del registro BX
    Add AL,BL       ; Se suman los dos registros
    Mov CL,30h
    Add AL,CL
    MOV DL,AL
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h         ; Se invoca a la interrupci?n del DOS 21h
    ;Resta
    ; imprimir cadena
    MOV DX,OFFSET cadena2 ; asignando a DX la variable cadena
    MOV AH, 09h          ; digo que se imprimira una cadena
    INT 21h              ;ejecuta la interrupcion, imprimira

    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    
    Mov AL,3h      ; Se asigna el valor a la parte baja del registro AX
    Mov BL,2h      ; Se asigna el valor a la parte baja del registro BX
    Sub AL,BL       ; Se suman los dos registros
    Mov CL,30h
    Add AL,CL
    MOV DL,AL
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h         ; Se invoca a la interrupci?n del DOS 21h
    
        ;Multiplicar
    ; imprimir cadena
    MOV DX,OFFSET cadena3 ; asignando a DX la variable cadena
    MOV AH, 09h          ; digo que se imprimira una cadena
    INT 21h              ;ejecuta la interrupcion, imprimira

    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    
    Mov AL,3h      ; Se asigna el valor a la parte baja del registro AX
    Mov BL,2h      ; Se asigna el valor a la parte baja del registro BX
    MUL BL       ; Se suman los dos registros
    Mov CL,30h
    Add AL,CL
    MOV DL,AL
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h         ; Se invoca a la interrupci?n del DOS 21h
    
    
    ;Dividir
    ; imprimir cadena
    MOV DX,OFFSET cadena4 ; asignando a DX la variable cadena
    MOV AH, 09h          ; digo que se imprimira una cadena
    INT 21h              ;ejecuta la interrupcion, imprimira

    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    
    Mov AX,11      ; Se asigna el valor a la parte baja del registro AX
    Mov BL,2      ; Se asigna el valor a la parte baja del registro BX
    DIV BL       ; Se suman los dos registros
    
    Mov CL,48
    Add AL,CL
    MOV DL,AL
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h         ; Se invoca a la interrupci?n del DOS 21h
    
    
    ;Residuo
    ; imprimir cadena
    MOV DX,OFFSET cadena5 ; asignando a DX la variable cadena
    MOV AH, 09h          ; digo que se imprimira una cadena
    INT 21h              ;ejecuta la interrupcion, imprimira

    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    
    Mov AX,11      ; Se asigna el valor a la parte baja del registro AX
    Mov BL,2      ; Se asigna el valor a la parte baja del registro BX
    DIV BL       ; Se suman los dos registros
        
    Mov CL,48
    Add AH,CL
    MOV DL,AH
    Mov AH,02       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
    Int 21h         ; Se invoca a la interrupci?n del DOS 21h
    
    Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
    int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
    
End programa