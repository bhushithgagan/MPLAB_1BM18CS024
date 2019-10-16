.model small
.data
num equ 04h
res dw 0

.code
    mov ax,@data
    mov ds,ax
    mov cl,num
    xor ax,ax
    call fact
    mov res,ax
    mov ah,4ch
    int 21h

    fact proc near
    cmp cl,00h
    je final
    push cx
    dec cl
    call fact
    pop cx
    mul cx
    ret

    final:  add ax,01h
            ret
            fact endp
            end