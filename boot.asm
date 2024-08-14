; boot.asm
[BITS 16]
[ORG 0x7C00]
    ; 打印字符 "Hello, OS!"
    mov ah, 0x0E
    mov al, 'H'
    int 0x10
    ; （省略其他字符的打印代码）
    jmp $
[TIMES 510 - ($ - $$) DB 0]
DW 0xAA55

