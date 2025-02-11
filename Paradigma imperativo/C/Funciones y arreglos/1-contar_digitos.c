#include <stdio.h>
#include <stdlib.h>

// 1. Realizar un programa que permita contar los d�gitos de un n�mero mediante
// una funci�n.

int contarDig(int num) {

    int c = 0;
    while (num%10 > 0) {
        num = num/10;
        c++;
    }

    return c;

}

int main() {

    int num;
    printf("Ingrese un n�mero:");
    scanf("%d", &num);
    printf("%d", contarDig(num));

    
}
