; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    nDati db ?
    sum db ?
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

    mov ah, 01h
    int 21h
    sub al, 48
    mov nDati, al
    mov cl, nDati

inizio_while:
    cmp cl, 0
    jle fine_ciclo
    mov ah, 01h
    int 21h
    sub al, 48
    add sum, al
    dec cl
    jmp inizio_while

fine_ciclo:
    mov ah, 0
    mov al, sum
    div nDati
    mov bx, ax
    mov bl, al
    
    add bl, 48
    mov dl, bl
    mov ah, 02h
    int 21h

    add bh, 48
    mov dl, bh
    mov ah, 02h
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
