#include <stdlib.h> /* EXIT_SUCCESS... */
#include <stdio.h>  /* printf()...     */
#include "pair.h"   /* TAD Par         */

// Falla porque no se ha definido el tipo pair_t

static void show_pair(pair_t p)
{
    printf("(%d, %d)\n", pair_first(p), pair_second(p));
}

int main(void)
{
    pair_t p, q;

    // Nuevo par p
    p = pair_new(3, 4);

    // Se muestra el par por pantalla
    printf("p = ");
    show_pair(p);

    // Nuevo para q con elementos de p intercambiados
    q = pair_swapped(p);

    // Se vuelve a mostrar p
    printf("p = ");
    show_pair(p);

    // Se muestra q
    printf("q = ");
    show_pair(q);

    // Se destruyen p y q
    p = pair_destroy(p);
    q = pair_destroy(q);

    return EXIT_SUCCESS;
}

// El nuevo dise;o si logra el encapulamiento ya que no se conoce la como esta construido el tipo
// pair_t. Se puede cambiar la implementacion sin que el usuario lo note.
