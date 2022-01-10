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
            
        ; chiede il primo numero 
    lea dx, input
    mov ah, 9
    int 21h    
    
	mov ah, 1
	int 21h
	sub al, 48
	mov n1, al

    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    ; Chiede il secondo numero
    lea dx, input2
    mov ah, 9
    int 21h   
     
	mov ah, 1
	int 21h
	sub al, 48
	mov n2, al
    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    
    
    
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
    

    ;stampa dei risultati
    ; stampa addizione
    add addi, 48
    mov ah, 2
	mov dl, addi
	int 21h              
	    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    ; stampa sottrazione
    add subbi, 48
    mov ah, 2
	mov dl, subbi
	int 21h                     
	    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    ; stampa moltiplicazione
    add molli, 48
    mov ah, 2
	mov dl, molli
	int 21h              
	    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    ; stampa divisione
    add divvi, 48
    mov ah, 2
	mov dl, divvi
	int 21h         
	    ;il programma va a capo
    mov ah, 2
    mov dx, 10
    int 21h

    mov ah, 2
    mov dx, 13
    int 21h
    ;-------
    ; stampa resto
    add rst, 48
    mov ah, 2     
	mov dl, rst
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
