; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"      
    n db ?  
    ris db ?
    n1 db ?  
    n2 db ? 
    n3 db ? 
    n4 db ? 
    n5 db ?    
    n6 db ? 
    n7 db ? 
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
    
    ; prima divisione  
    mov ax, 0
    mov al, n 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n1, ah   
    
    ; seconda divisione
    mov ax, 0
    mov al, ris 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n2, ah    
    ; terza divisione
    mov ax, 0
    mov al, ris 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n3, ah      
    ; quarta divisione
    mov ax, 0
    mov al, ris 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n4, ah      
    ; quinta divisione
    mov ax, 0
    mov al, ris 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n5, ah       
    ; sesta divisione
    mov ax, 0
    mov al, ris 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n6, ah   
    ; settima divisione
    mov ax, 0
    mov al, ris 
    mov dh, 2  
    div dh   
    mov bl, al  
    mov ris, bl
    mov n7, ah     
  
    
	mov ah, 2 
	add n7, 48
	mov dl, n7
	int 21h     
	
	mov ah, 2  
	add n6, 48
	mov dl, n6
	int 21h 
	
	mov ah, 2 
	add n5, 48
	mov dl, n5
	int 21h
	
	mov ah, 2  
	add n4, 48
	mov dl, n4
	int 21h
	
	mov ah, 2  
	add n3, 48
	mov dl, n3
	int 21h   
	
	mov ah, 2  
	add n2, 48
	mov dl, n2
	int 21h
	
	mov ah, 2 
	add n1, 48
	mov dl, n1
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
