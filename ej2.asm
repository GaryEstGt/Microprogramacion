.MODEL small
.DATA
; variable que contiene el texto que queremos mostrar
cadena DB 'Gary Andrez MoranN$'
cadena2 DB '1062917$'
cadena3 DB 'El simbolo ASCII es$'
.STACK
.CODE
Programa: ;etiqueta de inicio de programa
;inicializar programa
MOV AX, @Data
MOV DS, AX

; imprimir cadena
MOV DX,OFFSET cadena ; asignando a DX la variable cadena
MOV AH, 09h          ; digo que se imprimira una cadena
INT 21h              ;ejecuta la interrupcion, imprimira

MOV DX,OFFSET cadena2 ; asignando a DX la variable cadena
MOV AH, 09h          ; digo que se imprimira una cadena
INT 21h              ;ejecuta la interrupcion, imprimira

MOV DX,OFFSET cadena3 ; asignando a DX la variable cadena
MOV AH, 09h          ; digo que se imprimira una cadena
INT 21h              ;ejecuta la interrupcion, imprimira

XOR DX,DX

MOV DL,OFFSET 28h ; asignando a DX la variable cadena
MOV AH, 02h          ; digo que se imprimira una cadena
INT 21h              ;ejecuta la interrupcion, imprimira

;finalizar programa
MOV AH, 4Ch
INT 21h
END Programa
