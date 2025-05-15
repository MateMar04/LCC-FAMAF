#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "data.h"

void
print_data(data_t d) {
    printf("NOMBRE: %s\n"
           "EDAD  : %d años\n"
           "ALTURA: %d cm\n\n",
           d.name, d.age, d.height);
}

int main(void) {

    data_t messi = {"Leo Messi", 36, 169};
    print_data(messi);

    unsigned long int bytes_name = sizeof(messi.name);
    unsigned long int bytes_age = sizeof(messi.age);
    unsigned long int bytes_height = sizeof(messi.height);
    unsigned long int bytes_data = sizeof(messi);

    printf("name-size  : %lu bytes\n"
           "age-size   : %lu bytes\n"
           "height-size: %lu bytes\n"
           "data_t-size: %lu bytes\n", 
           bytes_name, bytes_age, bytes_height, bytes_data
        );

    
    
    printf("La direccion de memoria del nombre es: %p\n", (void *) &messi.name);
    printf("La direccion de memoria de la edad es: %p\n", (void *) &messi.age);
    printf("La direccion de memoria de la altura es: %p\n", (void *) &messi.height);
    
    
    printf("El índice de memoria del nombre es: %lu\n", (uintptr_t) &messi.name);
    printf("El índice de memoria de la edad es: %lu\n", (uintptr_t) &messi.age);
    printf("El índice de memoria de la altura es: %lu\n", (uintptr_t) &messi.height);
    

    data_t *p = NULL;
    p = malloc(sizeof(data_t));
    *p = messi;

    return EXIT_SUCCESS;
}
