//
// Created by mateo on 21/10/2024.
//

#include <stdio.h>

int sumatoria (int tam, int a[]) {
    int suma = 0;

    for (int i = 0; i < tam; i++) {
        suma += a[i];
    }

    printf("La sumatoria del arreglo es: %d\n", suma);
    return suma;
}
