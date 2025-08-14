#ifndef _LIST_H
#define _LIST_H

#include <stdbool.h>
#include <stddef.h>

typedef int list_elem;

typedef struct _list *list;

/* Constructors */
list empty(void);
/* Crea una lista vacía */

list addl(list l, list_elem e);
/* Agrega el elemento e al comienzo de la lista */

/* Destroy */
list destroy(list l);
/* Libera la memoria asociada a la lista */

/* Observers */
bool is_empty(list l);
/* Devuelve true si la lista está vacía */

list_elem head(list l);
/* PRE: !is_empty(l)
 * Devuelve el primer elemento de la lista */

list tail(list l);
/* PRE: !is_empty(l)
 * Elimina el primer elemento de la lista */

list addr(list l, list_elem e);
/* Agrega el elemento e al final de la lista */

size_t length(list l);
/* Devuelve la cantidad de elementos de la lista */

list concat(list l, list l0);
/* Agrega al final de l todos los elementos de l0 en el mismo orden */

list_elem index(list l, size_t n);
/* PRE: length(l) > n
 * Devuelve el elemento en la posición n */

list take(list l, size_t n);
/* Deja en l solo los primeros n elementos, eliminando el resto */

list drop(list l, size_t n);
/* Elimina los primeros n elementos de la lista */

list copy_list(list l1);
/* Devuelve una copia de l1 */

#endif
