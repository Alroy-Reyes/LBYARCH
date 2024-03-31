;section .data
;msg db "Hello World", 13, 10, 0

;section .text
;bits 64
;default rel

;global asmhello
;extern printf

;asmhello:
;	sub rsp, 8*5
;	lea rcx, [msg]
;	call printf
;	add rsp, 8*5
;	ret

;section .text
;bits 64
;default rel

;global sum

;sum:
;	add rcx, rdx  ; rcx - 1st param, rdx - 2nd param
;	mov rax, rcx  ; rax - return value
;	mov qword [r8],1  ; change the “reference” value to 1; r8 is the 3rd param
;	ret


; Assembly implementation of stencil function
; Inputs:
;   rdi: n (length of the vectors)
;   rsi: pointer to X array
;   rdx: pointer to Y array
stencil_asm:
    mov rax, rsi            ; Copy pointer to X array to rax
    mov rbx, rdx            ; Copy pointer to Y array to rbx
    mov ecx, 3              ; Initialize loop counter to 3

loop_start:
    movsd xmm0, [rax - 24]  ; Load X[i - 3] into xmm0
    movsd xmm1, [rax - 16]  ; Load X[i - 2] into xmm1
    movsd xmm2, [rax - 8]   ; Load X[i - 1] into xmm2
    movsd xmm3, [rax]       ; Load X[i] into xmm3
    movsd xmm4, [rax + 8]   ; Load X[i + 1] into xmm4
    movsd xmm5, [rax + 16]  ; Load X[i + 2] into xmm5
    movsd xmm6, [rax + 24]  ; Load X[i + 3] into xmm6

    ; Add all loaded values and store the result in Y[i]
    addsd xmm3, xmm0
    addsd xmm3, xmm1
    addsd xmm3, xmm2
    addsd xmm3, xmm4
    addsd xmm3, xmm5
    addsd xmm3, xmm6
    movsd [rbx + rcx*8], xmm3  ; Store the result in Y[i]

    add rcx, 1              ; Increment loop counter
    cmp rcx, rdi            ; Compare loop counter with n
    jl loop_start           ; If loop counter < n, repeat loop

    ret                     ; Return
