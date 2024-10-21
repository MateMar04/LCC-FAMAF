//
// Created by mateo on 21/10/2024.
//


#include <stdio.h>

struct div_t {
    int cociente;
    int resto;
};
struct div_t division(int x, int y) {
    struct div_t resultado;

    if (y == 0) {
        printf("No se puede dividir por 0\n");
        resultado.cociente = 0;
        resultado.resto = 0;
    } else {
        resultado.cociente = x / y;
        resultado.resto = x % y;
    }

    return resultado;
}

/*int x, y;

printf("Ingrese el dividendo (x): ");
scanf("%d", &x);
printf("Ingrese el divisor (y): ");
scanf("%d", &y);

struct div_t resultado = division(x, y);

if (y != 0) {
    printf("El cociente es: %d\n", resultado.cociente);
    printf("El resto es: %d\n", resultado.resto);
}

return 0;*/