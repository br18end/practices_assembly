TITLE MASM Template (main.asm)
; Description:
;
; Revision date:
INCLUDE Irvine32.inc
.data
arreglo dword 100 dup (?)
laSuma dword ?
noOrdenado byte 0dh,0ah,"Arreglo no ordenado",0
ordenado byte 0dh,0ah,"Arreglo ordenado",0
muestraSuma byte 0dh,0ah,"La suma del arreglo es",0
.code
main PROC
call clrscr
mov ebx,offset arreglo
mov ecx,lengthof arreglo
mov edx,type arreglo
call cargaArreglo
mov edx,offset noOrdenado
call writestring
call muestraArreglo
;call sumaArreglo
;mov laSuma,eax
;mov edx,offset muestraSuma
;call writestring
;call writeDec
;call ordenaArreglo
;call muestraArreglo
exit
main ENDP
cargaArreglo PROC
push ebx ;Respaldar los registros
push ecx ;Respaldar los registros
push edx ;Respaldar los registros
call Randomize
L1: call Random32
mov [ebx],eax
add ebx,edx
loop L1
pop edx ;Recuperar los registros
pop ecx ;Recuperar los registros
pop ebx ;Recuperar los registros
ret
cargaArreglo ENDP
muestraArreglo PROC
push ebx
push ecx
L2: mov eax,[ebx]
call writedec
add ebx,4
mov al,9
call writechar
loop L2
pop ecx
pop ebx
ret
muestraArreglo ENDP
END main
