#include <stdio.h>

int main() {
    // Declaración de variables
    int x, y, z;

    // Solicitar al usuario los valores de x, y, z
    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    printf("Ingrese el valor de z: ");
    scanf("%d", &z);


    // Calcular resultados
    printf("Resultado de x + y + 1 = %d\n", x + y + 1);
    printf("Resultado de z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);
    printf("Resultado de y-2 == (x*3+1) mod 5 = %d\n", y - 2 == (x * 3 + 1) % 5); // 0 == False y 1 == True
    printf("Resultado de y / 2 * x = %d\n", y / 2 * x);
    printf("Resultado de y < x * z = %d\n", y < x * z); // 0 == False y 1 == True

    // Para la ultima expresion el resultado es tipo int, 0 == False y 1 == True

    return 0;
}
