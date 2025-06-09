#include <stdlib.h>
#include <assert.h>
#include "list.h"

/* ------------- Representación interna ------------- */

typedef struct _node {
    elem            value;
    struct _node   *next;
} node_t;

struct _list {
    node_t *head;
};

/* ------------ Constructores / Destructores -------- */

list empty(void)
{
    list l = malloc(sizeof(struct _list));
    if (l == NULL) {
        exit(EXIT_FAILURE);
    }
    l->head = NULL;
    return l;
}

void destroy_list(list l)
{
    node_t *curr = l->head;
    while (curr != NULL) {
        node_t *aux = curr;
        curr = curr->next;
        free(aux);
    }
    free(l);
}

list addl(elem e, list l)
{
    node_t *new_node = malloc(sizeof(node_t));
    if (new_node == NULL) {
        exit(EXIT_FAILURE);
    }
    new_node->value = e;
    new_node->next  = l->head;
    l->head         = new_node;
    return l;
}

/* ------------------- Operaciones ------------------ */

bool is_empty(list l)
{
    return l->head == NULL;
}

elem head(list l)
{
    assert(!is_empty(l));
    return l->head->value;
}

list tail(list l)
{
    assert(!is_empty(l));
    node_t *old_head = l->head;
    l->head = old_head->next;
    free(old_head);
    return l;
}


list addr(list l, elem e)
{
    node_t *new_node = malloc(sizeof(node_t));
    if (new_node == NULL) {
        exit(EXIT_FAILURE);
    }
    new_node->value = e;
    new_node->next  = NULL;

    if (is_empty(l)) {
        l->head = new_node;
    } else {
        node_t *cur = l->head;
        while (cur->next != NULL) {
            cur = cur->next;
        }
        cur->next = new_node;
    }
    return l;
}

int length(list l)
{
    int len = 0;
    for (node_t *cur = l->head; cur != NULL; cur = cur->next) {
        ++len;
    }
    return len;
}

list concat(list l, list l0)
{
    for (node_t *cur = l0->head; cur != NULL; cur = cur->next) {
        l = addr(l, cur->value);        /* re-usa addr para mantener orden */
    }
    return l;
}

elem index(list l, int n)
{
    assert(n >= 0 && n < length(l));
    node_t *cur = l->head;
    for (int i = 0; i < n; ++i) {
        cur = cur->next;
    }
    return cur->value;
}

list take(list l, int n)
{
    if (n <= 0) {                       /* eliminar todo */
        destroy_list(l);
        l = empty();
        return l;
    }

    node_t *cur = l->head;
    for (int i = 1; i < n && cur != NULL; ++i) {
        cur = cur->next;
    }

    if (cur == NULL) {                  /* n >= length(l) ⇒ no cambia nada */
        return l;
    }

    /* cur apunta al último nodo que queremos conservar */
    node_t *to_free = cur->next;
    cur->next = NULL;

    while (to_free != NULL) {
        node_t *aux = to_free;
        to_free = to_free->next;
        free(aux);
    }
    return l;
}

list drop(list l, int n)
{
    for (int i = 0; i < n && !is_empty(l); ++i) {
        l = tail(l);
    }
    return l;
}

list copy_list(list src)
{
    list dst = empty();
    if (is_empty(src)) {
        return dst;
    }

    /* Copiar manteniendo el orden: recorrer src y añadir al final en dst */
    for (node_t *cur = src->head; cur != NULL; cur = cur->next) {
        dst = addr(dst, cur->value);
    }
    return dst;
}
