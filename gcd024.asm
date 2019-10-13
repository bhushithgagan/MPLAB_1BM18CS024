.model small
.data
a db 3
b db 12

.code
mov ax,@data
mov ds,ax
xor ax,ax
mov al,a
mov bl,b
call gcd
mov dl,al
add dl,30h
mov ah,02h
int 21h
mov ah,4ch
int 21h

gcd proc near
cmp bl,00h
je final
div bl
mov al,bl
mov bl,ah
mov ah,00h
call gcd

final:ret
      gcd endp
      end
