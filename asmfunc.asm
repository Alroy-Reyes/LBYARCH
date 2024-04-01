section .text
bits 64
default rel

global stencil_asm

stencil_asm:   
    sub rsp, 8*11       
    
    mov r12, rcx ; n
    mov r13, rdx ; X
    mov r14, r8  ; Y
    
    ; displacement variables
    mov rbx, 3
    mov r11, 0

LOOP:
    ; check if all elements of Y are identified
    cmp r11, r12
    je end
    
    ; stencil operation
    movsd xmm5, [r13 - 24 + 8*rbx] 
    addsd xmm5, [r13 - 16 + 8*rbx]
    addsd xmm5, [r13 - 8 + 8*rbx]
    addsd xmm5, [r13 + 8*rbx]
    addsd xmm5, [r13 + 8 + 8*rbx]
    addsd xmm5, [r13 + 16 + 8*rbx]
    addsd xmm5, [r13 + 24 + 8*rbx]
    
    ; store result in Y
    movsd [r14 + 8*r11], xmm5
    
    inc rbx
    inc r11
    jmp LOOP

end:
    add rsp, 8*11
    mov rax, r14 ; return Y

    ret       
