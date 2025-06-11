#include <stdlib.h>
#include <assert.h>
#include "list.h"

#define MAX_LENGTH 100

struct _list {
    elem a[MAX_LENGTH];
    int  start;   /* índice del primer elemento lógico */
    int  size;    /* cantidad de elementos en la lista */
};

/* ------------ Constructores ------------ */
list empty(void)
{
    list l = malloc(sizeof(struct _list));
    if (l == NULL) exit(EXIT_FAILURE);
    l->start = 0;
    l->size  = 0;
    return l;
}

list addl(elem e, list l)
{
    assert(l->size < MAX_LENGTH);
    l->start = (l->start - 1 + MAX_LENGTH) % MAX_LENGTH;
    l->a[l->start] = e;
    l->size++;
    return l;
}

/* ------------- Operaciones ------------- */
bool is_empty(list l) { return l->size == 0; }

elem head(list l)
{
    assert(!is_empty(l));
    return l->a[l->start];
}

list tail(list l)
{
    assert(!is_empty(l));
    l->start = (l->start + 1) % MAX_LENGTH;
    l->size--;
    return l;
}

list addr(list l, elem e)
{
    assert(l->size < MAX_LENGTH);
    int end = (l->start + l->size) % MAX_LENGTH;
    l->a[end] = e;
    l->size++;
    return l;
}

int length(list l) { return l->size; }

list concat(list l, list l0)
{
    assert(l->size + l0->size <= MAX_LENGTH);
    for (int i = 0; i < l0->size; ++i) {
        int idx = (l0->start + i) % MAX_LENGTH;
        l = addr(l, l0->a[idx]);
    }
    return l;
}

elem index(list l, int n)
{
    assert(0 <= n && n < l->size);
    int idx = (l->start + n) % MAX_LENGTH;
    return l->a[idx];
}

list take(list l, int n)
{
    if (n < 0) n = 0;
    if (n < l->size) l->size = n;
    return l;
}

list drop(list l, int n)
{
    if (n <= 0) return l;
    if (n >= l->size) { l->size = 0; l->start = 0; return l; }
    l->start = (l->start + n) % MAX_LENGTH;
    l->size -= n;
    return l;
}

list copy_list(list src)
{
    list dst = empty();
    for (int i = 0; i < src->size; ++i) {
        int idx = (src->start + i) % MAX_LENGTH;
        dst = addr(dst, src->a[idx]);
    }
    return dst;
}

void destroy_list(list l) { free(l); }
