TITLE MASM Template (main.asm)
; Description:
;
; Revision date:
INCLUDE Irvine32.inc
.data
arreglo dword 100 dup (?)
tamArreglo dword ?
intercambios dword ?
muestra byte "Los valores del arreglo son: ",0
espacio byte " ",0
.code
main PROC
mov edx, offset muestra
call writeString
mov ebx,offset arreglo
mov ecx,lengthof arreglo
call Randomize
L1: call Random32
mov edx, offset espacio
call writeString
call writeDec
mov [ebx],eax
loop L1
mov tamArreglo,lengthof arreglo
inicio:
dec tamArreglo
mov ecx,tamArreglo
xor ebx,ebx
mov intercambios, ebx
ciclo1:
mov eax,arreglo[ebx]
cmp eax,arreglo[ebx+4]
jge sigue
xchg eax,arreglo[ebx+4]
xchg eax, arreglo[ebx]
sigue:
loop ciclo1
cmp intercambios,0
Jne inicio
mov edx, offset muestra
call writeString
mov ecx,lengthof arreglo
L2:
mov edx, offset espacio
call writeString
call writeDec
loop L2
exit
main ENDP
END main
