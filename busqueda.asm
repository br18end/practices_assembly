TITLE MASM Template                        (main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
arreglo dword 100 dup(0)
datobuscar dword ?
sbuscar byte "Ingrese dato a buscar",0
smostrar byte "El dato si esta en el arreglo",0
smostrar byte "El dato no esta en el arreglo",0

.code
main PROC
    lea ebx,arreglo
    mov ecx,LENGHTOF arreglo
    lea edx,sbucar
    call writestring
    call readint
    mov datobuscar,eax

ciclo:
    cmp eax,arreglo[ebx]
    je igual
    mov ebx,4
    loop ciclo

igual:
    lea edx,smostrar
    call writestring

    exit
main ENDP

END main
