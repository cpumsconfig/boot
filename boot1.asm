; boot.asm
BITS 16
ORG 0x7C00

START:
    ; 设置段寄存器
    mov ax, 0x07C0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; 打印欢迎信息
    mov si, welcome_msg
    call print_string

    ; 加载内核（假设内核已放在0x8000）
    mov ax, 0x1000
    mov es, ax
    mov bx, 0x0000
    mov cx, 0x0002
    mov dx, 0x0000
    call load_kernel

    ; 跳转到内核
    jmp 0x1000:0x0000

print_string:
    ; 打印字符串
    mov ah, 0x0E
print_char:
    lodsb
    cmp al, 0
    je done
    int 0x10
    jmp print_char
done:
    ret

load_kernel:
    ; 读扇区并加载到内存（简单的模拟）
    mov ah, 0x02
    mov al, 0x01
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00
    int 0x13
    ret

welcome_msg db 'Welcome to MonoOS!', 0

TIMES 510 - ($ - $$) db 0
DW 0xAA55
