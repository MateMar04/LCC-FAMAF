//
// Created by mateo on 11/10/2024.
//

#include <stdio.h>
#include "entradas.h"

int pedir_entero(char name) {
    printf("Ingrese un valor entero para %c:\n ", name);
    int entero;
    scanf("%d", &entero);
    return entero;
}

void imprimir_entero(int x, char name) {
    printf("El entero %c es %d\n", name, x);
}
