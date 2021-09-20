TITLE MASM Template                        (main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
nombre BYTE 30 dup (?)

mWrite MACRO texto
    LOCAL cadena
    .data
    cadena BYTE texto,0
    .code
    push edx
    mov edx,OFFSET cadena
    call WriteString
    pop edx
ENDM

mRead MACRO
    push edx
    mov edx,OFFSET nombre
    call ReadString
    pop edx
ENDM

mWriteAr MACRO texto
    LOCAL cadena
    .data
    cadena BYTE texto,0
    .code
    push edx
    mwrite cadena
    push ebx
    xor ebx,ebx
    mov ecx,LENGHTOF nombre
    mov ebx,OFFSET nombre
    L1: mov edx,[ebx]
    call writestring
    loop L1
    pop ebx
    pop edx
ENDM

.code
main PROC
    mwrite "Introduce tu nombre: "
    mread
    mwritear "Sayonara "

    exit
main ENDP
END main
