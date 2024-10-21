//
// Created by mateo on 21/10/2024.
//


#include <stdbool.h>
#include <stdio.h>
#include "vocales.h"

bool es_vocal(char letra) {
    if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u') {
        printf("La letra ingresada %c es vocal\n", letra);
        return true;
    }
    printf("La letra ingresada %c no es vocal\n", letra);
    return false;
}

char pedir_char() {
    char x;
    printf("Ingrese un caracter: ");
    scanf("%c", &x);
    return x;
}
