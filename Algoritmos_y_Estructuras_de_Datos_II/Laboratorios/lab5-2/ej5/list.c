/* list.c */
#include <stdlib.h>
#include <assert.h>
#include <string.h>   /* memcpy */
#include "list.h"

#define MAX_LENGTH 100          /* capacidad máxima de la lista */

/* ----------- Representación privada ----------- */
struct _list {
    elem elems[MAX_LENGTH];
    int  size;                  /* cantidad de elementos válidos */
};

/* -------------- Constructores ----------------- */
list empty(void)
{
    list l = malloc(sizeof(struct _list));
    if (l == NULL) {                 /* sin memoria → abortamos */
        exit(EXIT_FAILURE);
    }
    l->size = 0;
    return l;
}

list addl(elem e, list l)
{
    assert(l->size < MAX_LENGTH);    /* evitamos overflow */
    /* Desplazar a la derecha para hacer lugar en elems[0] */
    memmove(&l->elems[1], &l->elems[0], l->size * sizeof(elem));
    l->elems[0] = e;
    l->size++;
    return l;
}

/* ------------------ Operaciones ---------------- */
bool is_empty(list l)
{
    return l->size == 0;
}

elem head(list l)
{
    assert(!is_empty(l));
    return l->elems[0];
}

list tail(list l)
{
    assert(!is_empty(l));
    /* Desplazar a la izquierda, descartando elems[0] */
    memmove(&l->elems[0], &l->elems[1], (l->size - 1) * sizeof(elem));
    l->size--;
    return l;
}

list addr(list l, elem e)
{
    assert(l->size < MAX_LENGTH);
    l->elems[l->size++] = e;
    return l;
}

int length(list l)
{
    return l->size;
}

list concat(list l, list l0)
{
    assert(l->size + l0->size <= MAX_LENGTH);
    memcpy(&l->elems[l->size], &l0->elems[0], l0->size * sizeof(elem));
    l->size += l0->size;
    return l;
}

elem index(list l, int n)
{
    assert(n >= 0 && n < l->size);
    return l->elems[n];
}

list take(list l, int n)
{
    if (n < 0) n = 0;
    if (n < l->size) {
        l->size = n;                  /* descarta los últimos */
    }
    /* si n ≥ size no cambia nada */
    return l;
}

list drop(list l, int n)
{
    if (n <= 0) return l;
    if (n >= l->size) {
        l->size = 0;                  /* queda vacía */
        return l;
    }
    /* Desplazar todo n lugares a la izquierda */
    memmove(&l->elems[0], &l->elems[n], (l->size - n) * sizeof(elem));
    l->size -= n;
    return l;
}

list copy_list(list src)
{
    list dst = empty();
    dst->size = src->size;
    memcpy(dst->elems, src->elems, src->size * sizeof(elem));
    return dst;
}

void destroy_list(list l)
{
    free(l);                          /* nada más que liberar la estructura */
}
