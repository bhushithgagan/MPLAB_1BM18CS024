.model small
.data
msg1 db 0dh,0ah, "Enter alphanumeric char $"
res db 02 dup(?)
.code
    mov ax,@data
    mov ds,ax
    lea dx,msg1
    call disp
    mov ah,01h
    int 21h
    mov bl,al
    mov cl,4
    shr al,cl
    cmp al,0ah
    jc digit
digit:  add al,30h
        mov res,al
        and bl,0fh
        cmp bl,0ah
        jc digit1
        add bl,07

digit1: add bl,30h
        mov res+1,bl
        mov ah,00h              ;For clearing the screen
        mov al,03h              ;To set the screen resolution
        int 10h             ;BIOS interrupt
        mov ah,02h      ;To display,
        mov bh,00h      ;the cursor on screen
        mov dh,0ch                  ;to set cursor position [row number]
        mov dl,28h                  ; [column number]
        int 10h
        mov res+2,'$'
        lea dx,res
        call disp
        mov ah,4ch
        int 21h
disp proc near
mov ah,09h
int 21h
ret
disp endp
end