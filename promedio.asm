TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
arreglo dword 10 dup (?)
pide byte 0dh,0ah,"Introduce un numero entero:",0
ssuma byte 0dh,0ah,"La suma es:",0
sprom byte 0dh,0ah,"El promedio es:",0
smayor byte 0dh,0ah,"Cantidad de numeros mayores que el promedio:",0
smenor byte 0dh,0ah,"Cantidad de numeros menores que el promedio:",0
suma dword ?
prom dword ?
mayores dword 0
menores dword 0
divisor dword 10
interaciones dword 10
		
.code
main PROC
	lea ebx,arreglo
	mov ecx,10
	xor esi,esi

ciclo:
	lea edx,pide
	call writestring
	call readint
	mov [ebx],eax
	add esi,eax
	add ebx,4
	loop ciclo

	mov suma,esi
	mov eax,suma
	lea edx,ssuma
	call writestring
	call writeint

	xor edx,edx
	div divisor
	mov prom, eax
	lea edx,sprom
	call writestring
	call writeint

	mov ecx,interaciones
	xor ebx,ebx
	xor esi,esi
ciclo2:
	cmp eax,arreglo[ebx+esi*4]
	jge mayor
	jl menor
mayor:
	inc mayores
	jmp sigue
menor:
	inc menores
sigue:
	inc esi
	loop ciclo2

	lea edx,smayor
	mov eax,mayores
	call writestring
	call writeint

	lea edx,smenor
	mov eax,menores
	call writestring
	call writeint

	exit
main ENDP
END main
