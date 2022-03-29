; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    num dw 200
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

    
    call input
    call stampaln
    
           
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends
     
; put in ax the number u wanna print out  
stampaln proc
    mov cx, 0 
stampaln_startf:
    cmp ax, 0       
    jg stampaln_continue
    je stampaln_fine
    jl stampaln_neg
    
stampaln_continue:
    mov dx, 0
    inc cx
    mov bx, 10
    div bx
    push dx
    jmp stampaln_startf
stampaln_fine:      
    pop dx
    mov dh, 0
    add dl, 48
    mov ah, 02h
    int 21h
    loop stampaln_fine
    
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h
    ret
 
stampaln_neg:
    mov bx, ax
    mov dl, '-'
    mov ah, 02h
    int 21h
    mov ax, bx
    mov bx, -1
    mul bx
    jmp stampaln_startf
    

stampaln endp



;request a endless number that is stored in ax
input proc  
    mov ax, 0
input_start: 
    mov dx, ax
    mov ah, 01h
    int 21h
    sub al, 48
    cmp al, 0
    jl input_fine
    cmp al, 9
    jg input_fine
    mov ah, 0
    
    
    ;il carattere e' un numero
    push ax
    mov ax, dx
    mov dx, 10
    mul dx
    pop dx
    add ax, dx
    jmp input_start
     
    
    
    
input_fine:
    push dx
    mov dl, 10
    mov ah, 02h
    int 21h 
    mov dl, 13
    mov ah, 02h
    int 21h
    pop ax
    ret
     

 
end start ; set entry point and stop the assembler.
