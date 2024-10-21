//
// Created by mateo on 21/10/2024.
//

#include <stdio.h>

void intercambiar(int tam, int a[], int i, int j) {
    if (i < 0 || i >= tam || j < 0 || j >= tam) {
        printf("Los índices ingresados no son válidos\n");
        return;
    }

    int aux = a[i];
    a[i] = a[j];
    a[j] = aux;
    printf("El arreglo intercambiado es: ");
    for (int k = 0; k < tam; k++) {
        printf("%d ", a[k]);
    }
}

/*int tam;

printf("Ingrese el tamaño del arreglo: \n");
scanf("%d", &tam);

int a[tam];

printf("Ingrese los valores del arreglo: \n");
for (int i = 0; i < tam; i++) {
    printf("Elemento %d: ", i);
    scanf("%d", &a[i]);
}

int i, j;

printf("Ingrese los indices a intercambiar: \n");
scanf("%d %d", &i, &j);

intercambiar(tam, a, i, j);*/
