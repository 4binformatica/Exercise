; multi-segment executable file template.

data segment
    ; add your data here!
        ; add your data here!
    fine db "fine del programma...$"
    input db "Inserisci il prezzo...$"
    input2 db "Inserisci la percentuale...$"
    nPrezzo db ?
    nPerc db ?
    dPrezzo db ?
    uPrezzo db ?
    dPerc db ?
    uPerc db ?
    percn db ?
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
    
    ; chiede le decine del primo numero
    lea dx, input
    mov ah, 9
    int 21h    
    
	mov ah, 1
	int 21h
	sub al, 48
	mov dPrezzo, al

    ; chiede le unità del primo numero 
	mov ah, 1
	int 21h
	sub al, 48
	mov uPrezzo, al

    ; chiede la percentuale decimne
    lea dx, input2
    mov ah, 9
    int 21h    
    
	mov ah, 1
	int 21h
	sub al, 48
	mov dPerc, al

    ; chiede la percentuale unità
    
	mov ah, 1
	int 21h
	sub al, 48
	mov uPerc, al

    ;creare prezzo
    mov al, 10
    mul dPrezzo
    mov ah, 0
    add al, uPrezzo
    mov nPrezzo, al

    ;creare percentuale
    mov al, 10
    mul dPerc
    mov ah, 0
    add al, uPerc
    mov nPerc, al

    ; percentuale
    mov al, nPrezzo
    mov ah, 0
    mov cl, 10
    div cl
    mul nPerc
    mov ah, 0
    mov percn, al

    mov cl, percn
    sub nPrezzo, cl

    ;stampa percentuale
    mov al, nPrezzo
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
    
    
    ;fine del programma
    lea dx, fine
    mov ah, 9
    int 21h      
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
