section .text
bits 64
default rel

global stencil_asm

stencil_asm:   
    sub rsp, 8*11       
    
    ;n, x, y respectively
    mov rsi, rcx 
    mov rdx, rdx 
    mov rdi, r8  
    
    ; variables
    mov rcx, 3  
    mov rax, 0 

LOOP:
    cmp rax, rsi
    je end
    
    ; stencil
    movsd xmm5, [rdx - 24 + 8*rcx] 
    addsd xmm5, [rdx - 16 + 8*rcx]
    addsd xmm5, [rdx - 8 + 8*rcx]
    addsd xmm5, [rdx + 8*rcx]
    addsd xmm5, [rdx + 8 + 8*rcx]
    addsd xmm5, [rdx + 16 + 8*rcx]
    addsd xmm5, [rdx + 24 + 8*rcx]
    
    ; Y values
    movsd [rdi + 8*rax], xmm5
    inc rcx
    inc rax
    jmp LOOP

end:
    add rsp, 8*11
    mov rax, rdi
    ret       
