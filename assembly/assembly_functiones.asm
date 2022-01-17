    ;double number print
    mov al, ;number to print
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
