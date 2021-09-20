TITLE MASM Template                        (main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
dato1 SDWORD ?
dato2 SDWORD ?
resultado SDWORD ?
pide BYTE "Dame un entero(positivo o negativo):",0
textoIguales BYTE "Los dos datos son iguales",0
textoMayor BYTE "El primer dato es mayor",0
textoMenor BYTE "El primer dato es menor",0

.code
main PROC
    mov edx,offset pide
    call WriteString
    call ReadInt
    mov dato1,eax

    mov edx,offset pide
    call WriteString
    call ReadInt
    mov dato2,eax

    cmp dato1,eax
    je iguales
    jg mayor

    menor:
    mov edx,offset textoMenor
    jmp imprime
    
    mayor:
    mov edx,offset textoMayor
    jmp imprime
    
    iguales:
mov edx,offset textoIguales
    jmp imprime
    
    imprime:
    call writestring

    exit
main ENDP

END main
