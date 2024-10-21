#include <stdio.h>
#include "vocales.h"
#include "intercambio_arreglos.h"
#include "sumatoria.h"

void intercambio_de_variables() {
    int x, y, z;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);

    z = x;
    x = y;
    y = z;

    printf("x = %d, y = %d\n", x, y);
}


void asignaciones_multiples_1() {
    int x, y, a;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);

    a = x;
    x = x + 1;
    y = a + y;

    printf("x = %d, y = %d\n", x, y);
}

void asignaciones_multiples_2() {
    int x, y, z, a, b;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    printf("Ingrese el valor de z: ");
    scanf("%d", &z);

    a = x;
    b = y;

    x = y;
    y = b + a + z;
    z = b + a;

    printf("x = %d, y = %d, z = %d\n", x, y, z);
}

// Falta Ejercicio 4

int suma_hasta(int n) {
    int suma = 0;

    if (n < 0) {
        printf("El número ingresado es negativo\n");
        return -1;
    }

    while (n > 0) {
        suma += n;
        n--;
    }
    printf("El resultado de la suma es: %d\n", suma);
    return suma;
}

void pedir_arreglo(int n_max, int a[]) {
    printf("Ingrese los valores del arreglo: \n");
    for (int i = 0; i < n_max; i++) {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[]) {
    printf("El arreglo ingresado es: ");
    for (int i = 0; i < n_max; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

/*
int n_max;
printf("Ingrese el tamaño del arreglo: \n");
scanf("%d", &n_max);

int a[n_max];

pedir_arreglo(n_max, a);

imprimir_arreglo(n_max, a);
 */


int main() {
    int n_max;
    printf("Ingrese el tamaño del arreglo: \n");
    scanf("%d", &n_max);

    int a[n_max];
    printf("Ingrese los valores del arreglo: \n");
    for (int i = 0; i < n_max; i++) {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
    }

    sumatoria(n_max, a);

    return 0;
}