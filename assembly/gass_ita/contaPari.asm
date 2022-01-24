; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    count db 0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    mov ah, 01h
    int 21h
    sub al, 48
    mov bl, 10
    mul bl
    mov bl, al
    mov ah, 01h
    int 21h
    sub al, 48
    add al, bl
    mov cl, al
    mov ch, 0

    mov ah, 02h
    mov dl, 10
    int 21h

    mov ah, 02h
    mov dl, 13
    int 21h


inizio_for:
    mov ah, 01h
    int 21h
    sub al, 48
    mov bl, 10
    mul bl
    mov bl, al
    mov ah, 01h
    int 21h
    sub al, 48
    add al, bl
    mov ah, 0h
    mov bl, 2
    div bl
    cmp ah, 0
    jg false
true:
    add count, 1
false:
    mov ah, 02h
    mov dl, 10
    int 21h

    mov ah, 02h
    mov dl, 13
    int 21h

    loop inizio_for

    mov al, count
    mov ah, 0
    mov cl, 10
    div cl
    mov bh, ah
    mov bl, al
    add bh, 48
    add bl, 48
    mov ah, 02h
    mov dl, bl
    int 21h
    mov ah, 02h
    mov dl, bh
    int 21h




    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx

    ; wait for any key....
    mov ah, 1
    int 21h

    mov ax, 4c00h ; exit to operating system.
    int 21h
ends

end start ; set entry point and stop the assembler.
