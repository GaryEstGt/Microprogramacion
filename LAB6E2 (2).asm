.model small
.stack 
.data

  	cadena1 db 0ah,0dh, 'Cadena 1: ', '$'
  	cadena2 db 0ah,0dh, 'Cadena 2: ', '$'
  	cadena3 db 0ah,0dh, 'Son iguales ', '$'
  	cadena4 db 0ah,0dh, 'Son diferentes ', '$'
  	arr db 50 dup(' '), '$' 
  	arreglo2 db 50 dup(' '), '$' 
.code 
inicio:
  	mov ax,@data
 	mov ds,ax
  	mov ah,09
  	mov dx,offset cadena1  ;Imprimimos el cadena1
  	int 21h
 
  	lea si,arr  ;Cargamos en el registro si al primer arreglo
pedir1:
  	mov ah,01h  ;Pedimos un carácter
  	int 21h
  	mov [si],al  ;Se guarda en el registro indexado al arreglo
  	inc si
  	cmp al,0dh  ;Se cicla hasta que se digite un Enter
  	ja pedir1
  	jb pedir1

 	mov ax,@data
  	mov ds,ax
  	mov ah,09
  	mov dx,offset cadena2  ;Imprime mensaje  2
  	int 21h
  	lea si,arreglo2  ; Se carga en SI el arrtor2

pedir2:    ;Mismo procedimiento que pedir1
  	mov ah,01h
  	int 21h
  	mov [si],al
  	inc si
  	cmp al,0dh
  	ja pedir2
  	jb pedir2
  
  	mov cx,50   ;Determinamos la cantidad de datos a leer/comparar
  	mov AX,DS  ;mueve el segmento datos a AX
  	mov ES,AX  ;Mueve los datos al segmento extra

compara: 
 	lea si,arr  ;cargamos en si la cadena que contiene arr
  	lea di,arreglo2 ;cargamos en di la cadena que contiene arreglo2
  	cmp si,di  ;compara las dos cadenas
  	Jne diferente ;si no fueron igual
  	je iguales ;Si fueron iguales
 
iguales:
   	mov ax,@data
  	mov ds,ax
  	mov ah,09
  	mov dx,offset cadena3 ;Imprime que son iguales y finaliza el programa.
  	int 21h
  	mov ah,04ch
  	int 21h

diferente:
  	mov ax,@data
  	mov ds,ax
  	mov ah,09
  	mov dx,offset cadena4  ; Imprime que son diferentes y finaliza el programa.
  	int 21h
  	mov ah,04ch
  	int 21h
end