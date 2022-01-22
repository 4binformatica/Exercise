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
    
inizio_while:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov ah, 02h
    mov dl, 13
    int 21h
    

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
    jg inizio_while
     
    
    
fine_while:
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
