#include <stdio.h>

void ejercicio1() {
    //  Declaración de variables
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
}

void ejercicio3() {
    int x;
    printf("Ingrese un valor x\n");
    scanf("%d", &x);
    x = 5;
    printf("%d\n", x);

    int a, b;
    printf("Ingrese valores para a y b (separados por espacio):\n");
    scanf("%d %d", &a, &b);
    a = a + b;
    b = b + b;
    printf("Resultados: a = %d, b = %d\n", a, b);

    int c, d;
    printf("Ingrese valores para c y d (separados por espacio):\n");
    scanf("%d %d", &c, &d);
    d = d + d;
    c = c + d;
    printf("Resultados: c = %d, d = %d\n", c, d);
}

int main() {
    ejercicio3();
}
