TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
arreglo dword 100 dup (?)
espacio BYTE " ", 0
intercambios dword 0
tamarreglo dword ?
muestra BYTE "El arreglo ya se ordeno",0

.code
main PROC
	mov tamArreglo, lengthof arreglo
	mov ebx, offset arreglo
	call randomize
	mov ecx, 100
L1:
	 call random32
	 mov [ebx], eax
	 add ebx, type arreglo
	 mov edx, offset espacio
	 call writestring
	 call writedec
loop L1

inicio:
	dec tamarreglo
	mov ecx, tamarreglo
	xor ebx, ebx
	mov eax, arreglo[ebx]	
comparar:
	cmp eax, arreglo [ebx+4]
	jge decrementar
	xchg eax, arreglo [ebx+4]
decrementar:
	dec ecx
	cmp ecx, 0
	jle intercambia
	jg comparar
intercambia:
	cmp intercambios, 0
	jne comparar
	mov edx, offset muestra
	call writestring
	exit
main ENDP
END main
