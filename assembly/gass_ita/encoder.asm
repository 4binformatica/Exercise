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
    mov [bx + di], al
    inc di
    loop ciclo_req

    mov di, 0h
    mov cx, 10   
ciclo_controllo:
    cmp [bx + di], 101 ;e
    je e
    cmp [bx + di], 111 ;o
    je o
    cmp [bx + di], 105 ;i
    je i
return:
    inc di
    loop ciclo_controllo
    jmp exit

e:
    mov [bx + di], 51
    jmp return
o:
    mov [bx + di], 48
    jmp return
i:
    mov [bx + di], 49
    jmp return

exit:

    mov di, 0h
    mov cx, 10      
ciclo_stampa:
    mov ah, 02h
    mov dl, [bx + di]
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
