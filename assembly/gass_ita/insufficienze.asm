; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    inserisciDati db "inserisci il numero delle materie...$"
    promossoStr db "sei promosso!$"
    bocciatoStr db "sei bocciato!$"
    rimandatoStr db "sei rimandato!$"
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


;start your code here
    lea dx, inserisciDati
    mov ah, 9
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

    cmp al, 6
    jl insufficiente
    jmp sufficiente
insufficiente:
    inc count
    jmp end_if
sufficiente:
    jmp end_if
end_if:
    mov ah, 02h
    mov dl, 10
    int 21h

    mov ah, 02h
    mov dl, 13
    int 21h

    loop inizio_for

    cmp count, 0
    je promosso
    jmp nonPromosso
promosso:
    lea dx, promossoStr
    mov ah, 9
    int 21h  
    jmp fine_if
nonPromosso:
    cmp count, 3
    jle rimandato
    jg bocciato

rimandato:
    lea dx, rimandatoStr
    mov ah, 9
    int 21h  
    jmp fine_if
bocciato:
    lea dx, bocciatoStr
    mov ah, 9
    int 21h  
    jmp fine_if
fine_if:
    mov ah, 02h
    mov dl, 10
    int 21h

    mov ah, 02h
    mov dl, 13
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
