; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    vet db 10 dup(?)
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


    lea bx, vet
    mov di, 0h
    mov cx, 10

ciclo_req:
    mov ah, 01h
    int 21h
    sub al, 48
    mov [bx + di], al
    inc di
    loop ciclo_req
    
    
    mov di, 0h      
    mov cx, 10
    mov ah, [bx + di]
ciclo_controllo:
    cmp [bx + di], ah
    jg maggiore
return:
    inc di
    loop ciclo_controllo
    jmp exit

maggiore:     
    mov ah, [bx + di]
    jmp return
exit:
    mov dl, ah
    add dl, 48
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
