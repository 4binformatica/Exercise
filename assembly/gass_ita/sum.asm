; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    vet1 db 5 dup(0)
    vet2 db 5 dup(0)
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
                   
    
    mov di, 0 
    mov cx, 5
ciclo_vet1: 
    lea bx, vet1          
    mov [bx + di], di
    lea bx, vet2
    mov [bx + di], di
    inc di
    loop ciclo_vet1
    
    mov di, 0 
    mov cx, 5   

ciclo_somma: 
    lea bx, vet1
    mov ah, [bx + di]
    lea bx, vet2
    mov al, [bx + di]
    add ah, al
    lea bx, vet1
    mov [bx + di], ah
    inc di
    loop ciclo_somma
    
    
    mov di, 0 
    mov cx, 5
ciclo_stampa:
    lea bx, vet1
    mov al, [bx + di]
    mov ah, 0
    mov dl, 10
    div dl
    mov dl, al
    mov dh, ah
    add dl, 48
    mov ah, 02h
    int 21h
    mov dl, dh
    add dl, 48
    mov ah, 02h
    int 21h
    mov ah, 02h
    mov dl, 10 
    int 21h 
    mov ah, 02h
    mov dl, 13 
    int 21h
    
    inc di
    loop ciclo_stampa
    
           
    
            
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
