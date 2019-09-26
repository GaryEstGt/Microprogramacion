.model small
.code
.stack				
programa:				
		Mov AX,@DATA
		Mov DS,AX	
		Mov AX,0000h
		Mov BX,0000h
		Mov AL,15h	
		Mov BL,15h	
		Add AL,BL		
		Mov CL,30h
		Add AL,CL
		Mov DL,AL		
		Mov AH,02h		
		Int 21h			
		Mov AH,4CH		
		Int 21h			

End programa