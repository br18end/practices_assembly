TITLE MASM Template                        (main.asm)


; Description:
; 
; Revision date:


INCLUDE Irvine32.inc
.data
arreglo dword 100 dup (?)
espacio byte " ",0
tamarreglo dword ?
intercambios dword ?


.code
main PROC
    lea ebx,arreglo
    call Randomize
    mov ecx,100


ciclo:
    call Random32
    mov [ebx],eax
    add ebx,4
    call writedec
    lea edx,espacio
    call writestring
    loop ciclo


    mov tamarreglo,lengthof arreglo


inicio:
    mov intercambios,0
    dec tamarreglo
    mov ecx,tamarreglo
    xor ebx,ebx


ciclo1:
    mov eax,arreglo[ebx]
    cmp eax,arreglo[ebx+4]
    xchg eax,[ebx+4]
    xchg [ebx],eax
    xchg esi,[ebx]
    xchg [ebx+4],esi
    dec ecx
cmp ecx,0
    jg ciclo1


    cmp intercambios,0
    jne inicio


;ciclo:
;    mov [ebx],eax
;    add ebx,4
;    call writedec
;    lea edx,espacio
;    call writestring
;    loop ciclo


    exit
main ENDP


END main
