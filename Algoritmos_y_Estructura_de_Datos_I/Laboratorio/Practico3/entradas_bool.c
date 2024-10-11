//
// Created by mateo on 11/10/2024.
//

#include <stdio.h>
#include <stdbool.h>

bool pedir_booleano(char name) {
    printf("Ingrese un valor booleano para %c:\n ", name);
    bool booleano;
    scanf("%d", &booleano);
    return booleano;
}

void imprimir_booleano(bool x, char name) {
    printf("El booleano %c es %d\n", name, x);
}