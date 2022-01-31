; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    vet db 10 dup(?)
    found db "il carattere e' stato trovato$"
    not_found db "il carattere non e' stato trovato$"
    
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
    
    mov ah, 01h
    int 21h
    mov dh, al
    

ciclo_req:
    mov ah, 01h
    int 21h
    mov [bx + di], al
    inc di
    loop ciclo_req
    

    mov di, 0h
    mov cx, 10   
ciclo_controllo:
    cmp [bx + di], dh
    je trovato
    inc di
    loop ciclo_controllo
    jmp non_trovato
trovato:     
    lea dx, found
    mov ah, 9
    int 21h
    jmp exit
non_trovato:
    lea dx, not_found
    mov ah, 9
    int 21h 
    jmp exit
exit:                   
    



            
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
