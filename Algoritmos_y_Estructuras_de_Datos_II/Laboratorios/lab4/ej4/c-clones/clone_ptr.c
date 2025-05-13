#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "ansicolors.h"

#define MAX_LENGTH 1820

char *string_clone(const char *str, size_t length) {
    char *output = NULL;
    output = malloc(length + 1);
    if (output != NULL) {
        for (size_t i = 0; i < length; i++) {
            output[i] = str[i];
        }
        output[length] = '\0';
    }
    return output;
}

int main(void) {
    char *original = ""
         "______ time ago in a galaxy far, far away...\n\n\n"
         ANSI_BRGOLD
         "         _______..___________.     ___      .______             \n"
         "        /       ||           |    /   \\     |   _  \\          \n"
         "       |   (----``---|  |----`   /  ^  \\    |  |_)  |          \n"
         "        \\   \\        |  |       /  /_\\  \\   |      /        \n"
         "    .----)   |       |  |      /  _____  \\  |  |\\  \\----.    \n"
         "    |_______/        |__|     /__/     \\__\\ | _| `._____|     \n"
         "                                                                \n"
         "____    __    ____      ___      .______           _______.     \n"
         "\\   \\  /  \\  /   /     /   \\     |   _  \\         /       |\n"
         " \\   \\/    \\/   /     /  ^  \\    |  |_)  |       |   (----` \n"
         "  \\            /     /  /_\\  \\   |      /         \\   \\    \n"
         "   \\    /\\    /     /  _____  \\  |  |\\  \\----..----)   |   \n"
         "    \\__/  \\__/     /__/     \\__\\ | _| `._____||_______/     \n"
         "\n\n\n"
         "                           Episode II \n\n"
         "                      ATTACK OF THE CLONES\n\n"
         "                There is  unrest in the Galactic\n"
         "                Senate. Several  thousand  solar\n"
         "                systems  have   declared   their\n"
         "                intentions to leave the Republic.\n\n"
         "                This      separatist     movement,\n"
         "                under  the   leadership   of  the\n"
         "                mysterious   Count   Dooku,   has\n"
         "                made it difficult for the limited\n"
         "                number   of   Jedi   Knights   to\n"
         "                maintain   peace   and  order  in\n"
         "                the galaxy.\n\n"
         "                Senator   Amidala,   the   former\n"
         "                Queen   of  Naboo,  is  returning\n"
         "                to  the  Galactic  Senate to vote\n"
         "                on the critical issue of creating\n"
         "                an    ARMY    OF   THE   REPUBLIC\n"
         "                to    assist    the   overwhelmed\n"
         "                Jedi....\n" ANSI_WHITE;

    char *copy = NULL;

    copy = string_clone(original, strlen(original));
    if (copy == NULL) {
        fprintf(stderr, "Error: no se pudo asignar memoria para la copia\n");
        return EXIT_FAILURE;
    }

    printf("Original:\n" ANSI_CYAN " %s\n", original);

    copy[0] = 'A';
    copy[1] = ' ';
    copy[2] = 'l';
    copy[3] = 'o';
    copy[4] = 'n';
    copy[5] = 'g';

    printf("Copia   :\n" ANSI_CYAN " %s\n", copy);

    free(copy);
    return EXIT_SUCCESS;
}

/*
En este archivo se cambió el tipo de `original` a `char *` apuntando a un
literal de cadena. Estos literales residen en una sección de solo lectura
del programa. Intentar modificar `original` directamente (como en:
original[0] = 'A';) causaría un segmentation fault.

Por eso, se utiliza string_clone() para crear una copia en memoria dinámica
que sí puede modificarse con seguridad.

Evitar modificar directamente literales string en C, ya que su comportamiento
no está definido y puede provocar errores fatales en tiempo de ejecución.
*/
