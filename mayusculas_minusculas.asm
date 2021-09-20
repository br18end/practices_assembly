TITLE MASM Template                        (main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
buffertexto byte 101 dup (0)
pidestring byte "Dame una cadena de caracteres: ",0
muestra byte "El string en mayusculas es: ",0
msjerror byte "Error: el caracter no es una letra",0

.code
main PROC
    lea edx,pidestring
    call writestring
    
    lea edx,buffertexto
    mov ecx,100
    call readstring

    xor ebx,ebx
    
ciclo:
    cmp buffertexto[ebx],'a'
    jl error 
    cmp buffertexto[ebx],'z'
    jg error
    mov al,buffertexto[ebx]
    mov al,20h
    sub buffertexto[ebx],al

error:
    cmp buffertexto[ebx],0
    je imprime
    inc ebx
    jmp ciclo

imprime:
    lea edx,muestra
    call writestring
    lea edx,buffertexto
    call writestring

    exit
main ENDP

END main
