// kernel.cpp
extern "C" void kernel_main() {
    // 内核主函数
    const char *str = "Hello, OS!";
    char *video_memory = (char *)0xb8000; // VGA 显示内存
    while (*str) {
        *video_memory++ = *str++; // 字符
        *video_memory++ = 0x07;   // 属性字节（白色文本，黑色背景）
    }
}
