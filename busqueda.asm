TITLE MASM Template						(main.asm)
; Description:
; 
; Revision date:
INCLUDE Irvine32.inc
.data
arreglo dword 1,2,3,4,5,6,7,8,9
datobuscar dword ?
sbuscar byte "Ingrese dato a buscar ",0
siesta byte "El dato si esta en el arreglo",0
noesta byte "El dato no esta en el arreglo",0

.code
main PROC
	mov edx,offset sbuscar
	call writestring
	call readint
	mov datobuscar,eax
	mov ebx,offset arreglo
	mov ecx,lengthof arreglo

ciclo:
	cmp eax,[ebx]
	je igual
	add ebx,4
	loop ciclo
	jmp error

igual:
	lea edx,siesta
	call writestring
	jmp salir

error:
	lea edx,noesta
	call writestring

salir:
	exit
main ENDP
END main
