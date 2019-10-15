.model small
.data
x db 2
res dw ?

.code 
mov ax,@data
mov ds,ax
mov ax,x
mul ax
mul x
mov bx,9
mul bx
mov bx,ax
mov ax,x
mul x
mov cx,5
mul cx
add ax,bx
sub ax,2
mov res,ax
mov ah,4ch
int 21h
end
