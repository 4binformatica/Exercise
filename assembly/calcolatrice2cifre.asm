; multi-segment executable file template.

data segment
    ; add your data here!
        ; add your data here!
    fine db "fine del programma...$"
    input db "Inserisci un numero...$"
    input2 db "Inserisci il secondo numero...$"
    n1 db ?
    n2 db ?
    addi db ?
    subbi db ?
    molli db ?
    divvi db ?
    rst db ?
    dn1 db ?
    un1 db ?
    dn2 db ?
    un2 db ?
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
	mov dn1, al

    ; chiede le unità del primo numero 
	mov ah, 1
	int 21h
	sub al, 48
	mov un1, al

    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    ; chiede le decine del secondo numero
    lea dx, input
    mov ah, 9
    int 21h    
    
	mov ah, 1
	int 21h
	sub al, 48
	mov dn2, al

    ; chiede le unità del secondo numero  
    
	mov ah, 1
	int 21h
	sub al, 48
	mov un2, al
    

    ;creare n1
    mov al, 10
    mul dn1
    mov ah, 0
    add al, un1
    mov n1, al

    ;creare n2
    mov al, 10
    mul dn2
    mov ah, 0
    add al, un2
    mov n2, al



    ;addizione
    mov dl, n1
    add dl, n2
    mov addi, dl

    ;sottrazione
    mov al, n1
    sub al, n2
    mov subbi, al

    ; moltiplicazione
    mov al, n1
    mul n2
    mov molli, al    

    ;divisione
    mov al, n1    
    mov ah, 0
    div n2
    mov divvi, al
    mov rst, ah
    

    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;------- 

    ;stampa somma
    mov al, addi
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
    
    
    
    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    ;stampa sottrazione
    mov al, subbi
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
    
    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    ;stampa moltiplicazione
    mov al, molli
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
    
    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    ;stampa divisione
    mov al, divvi
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
    
    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    ;stampa resto
    mov al, rst
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
    
    
    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    

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
