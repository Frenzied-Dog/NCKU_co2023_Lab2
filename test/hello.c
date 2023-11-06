#include "./user/user.h"

int main(void) {
    puts("Hello, World!\n");
    putint(46287); putchar('\n');
    putint(-5866); putchar('\n');
    puthex_L(1511); putchar('\n');
    puthex_U(1511); putchar('\n');
    putchar('\n');
    printf("char: %c\nd: %d\nx: %x\nX: %X\nstr: %s\n", '*', 11077, 11077, 11077, "Meow~~");
    printf("#x: %#x\n#X: %#X\n", 11077, 11077);
    exit();
}