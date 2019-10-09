
Skip to content
Using Gmail with screen readers
Conversations
1.2 GB (7%) of 15 GB used
Manage
Terms · Privacy · Program Policies
Last account activity: 58 minutes ago
Details

.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
msg1 db 0dh,0ah,"Enter the file name : $"
msg2 db 0dh,0ah,"File created successfully $"
msg3 db 0dh,0ah,"Creation failed $"
msg4 db 0dh,0ah,"Enter file name to delete: $"
msg5 db 0dh,0ah,"Deleted successfully $"
msg6 db 0dh,0ah,"Deletion failed $"
fname db 40h dup(?)
fname2 db 40h dup(?)
.code
start: mov ax,@data
        mov ds,ax
        display msg1
        mov si,offset fname
        mov ah,01h
back: mov ah,01h
        int 21h
        cmp al,0dh
        je next
        mov[si],al
        inc si
        jmp back
 next: mov [SI],byte ptr '$'
        lea dx,fname
        mov cx,00h
        mov ah,3ch
        int 21h
        jc failed
        display msg2
        jmp next1
failed: display msg3
next1: display msg4
        mov si,offset fname2
 back1: mov ah,01h
 int 21h
 cmp al,0dh
 je next2
 mov [si],al
 inc si
 jmp back1
 next2 : mov[si],byte ptr '$'
        lea dx,fname2
        mov ah,41h
        int 21h
        jc dfail
        display msg5
        jmp final
 dfail: display msg6
 final: mov ah,4ch
 int 21h
 end start

FILE024.asm
Displaying FILE024.asm.
