TITLE MASM Template                        (main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
arreglo dword 10
dword 20
dword 30
dword 40
dword 50
muestra byte "La suma de todos los valores es:",0

.code
main PROC
mov ebx,OFFSET arreglo
xor eax,eax        ; inicializar en cero el acumulador
xor esi,esi        ; limpiar el registro esi
mov ecx,5        ; el registro contador con 5

sigue:
add eax,[ebx+esi]

add esi,4

loop sigue        ; decrementa el reistro contador y si no es cero salta a la etiqueta

mov edx,offset muestra
call writestring
call writeint

exit
main ENDP
END main
