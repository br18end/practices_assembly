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
muestra byte "La suma de los valores es:",0
        
.code
main PROC
    mov ebx,offset arreglo
    mov ecx,5
    xor eax,eax
    mov esi,eax

ciclo1:
    add eax,[ebx+esi*4]        ; el 4 es el factor de escala
    inc esi        ; incremento en uno
    loop ciclo1

    mov edx,offset muestra
    call writestring
    call writeint
    
    exit
main ENDP
END main
