; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
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
    mov bl, 10
    mul bl
    mov bl, al
    mov ah, 01h
    int 21h
    sub al, 48
    add al, bl
    mov cx, 0
    
ciclo1:
    mov ah, 0
    mov bl, 2
    div bl
    mov dl, al
    mov dh, ah
    mov dl, dh
    mov dh, 0
    push dx
    inc cx
    cmp al, 0
    jg ciclo1

ciclo2:
    pop dx
    add dx, 48
    mov ah, 02h
    int 21h
    loop ciclo2
      
    
     

    
    
    
    
        
            
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
