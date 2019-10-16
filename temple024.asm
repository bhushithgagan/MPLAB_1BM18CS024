.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data 
str db "TEMPLE$"
len equ ($-str)

.code
mov ax,@data
mov es,ax
mov ds,ax

cld
mov cx,len-1
mov ah,00
mov al,'E'
lea di,str
mov bl,'A'

check: repne scasb
       mov [di-1],bl
       cmp cx,00
       jnz check
       display str
       mov ah,4ch
       int 21h
       end
