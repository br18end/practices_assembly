TITLE MASM Template                        (main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
dato1 SDWORD ?
dato2 SDWORD ?
resultado SDWORD ?
myMessage BYTE "Dame un entero:",0
myMessage2 BYTE "El resultado de la suma de ellos es:",0

.code
main PROC
    mov edx,OFFSET myMessage
    call WriteString

    call ReadInt
    mov dato1,eax

    mov edx,OFFSET myMessage
    call WriteString

    call ReadInt
    mov dato2,eax

    mov eax,dato1
    add eax,dato2
    mov resultado,eax

    mov edx,OFFSET myMessage2
    call WriteString

    mov eax,resultado
    call WriteInt

    exit
    main ENDP

END main
