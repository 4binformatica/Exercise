; multi-segment executable file template.

data segment
    ; add your data here! 
    pkey db "press any key...$" 
    dispari db "dispari...$" 
    nv db ?  
    n db ?
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        8                                                                                                                                                                                                                                                                                                                                                   9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    ; quante vole   
    mov ah, 1
	int 21h   
	sub al, 48
	mov nv, al     
	
inizio_while:   
    cmp nv, 0
    jl fine_ciclo    
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
    mov n, al   
    
    mov bl, 2
    mov al, n  
    mov bh, 0
    cmp ah, bh
    jl pari_zone
    
    dec nv
    jmp inizio_while
    
    
pari_zone:
    lea dx, dispari
    mov ah, 9
    int 21h
         
fine_ciclo:
    
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
