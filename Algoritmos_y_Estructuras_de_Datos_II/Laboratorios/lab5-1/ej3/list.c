#include <stdlib.h>
#include <assert.h>
#include "list.h"

typedef struct _node
{
    list_elem elem;
    struct _node *next;
} node_t;

struct _list
{
    node_t *head;
};

list empty(void)
{
    list l = malloc(sizeof(struct _list));
    if (l == NULL)
        exit(EXIT_FAILURE);
    l->head = NULL;
    return l;
}

list destroy(list l)
{
    node_t *current = l->head;
    while (current != NULL)
    {
        node_t *temp = current;
        current = current->next;
        free(temp);
    }
    free(l);
    return NULL;
}

bool is_empty(list l)
{
    return l->head == NULL;
}

list_elem head(list l)
{
    assert(!is_empty(l));
    return l->head->elem;
}

list tail(list l)
{
    assert(!is_empty(l));
    node_t *old_head = l->head;
    l->head = old_head->next;
    free(old_head);
    return l;
}

list addl(list l, list_elem e)
{
    node_t *new_node = malloc(sizeof(node_t));
    if (new_node == NULL)
        exit(EXIT_FAILURE);
    new_node->elem = e;
    new_node->next = l->head;
    l->head = new_node;
    return l;
}

list addr(list l, list_elem e)
{
    node_t *new_node = malloc(sizeof(node_t));
    if (new_node == NULL)
        exit(EXIT_FAILURE);
    new_node->elem = e;
    new_node->next = NULL;

    if (is_empty(l))
    {
        l->head = new_node;
    }
    else
    {
        node_t *cur = l->head;
        while (cur->next != NULL)
        {
            cur = cur->next;
        }
        cur->next = new_node;
    }

    return l;
}

size_t length(list l)
{
    size_t len = 0;
    node_t *cur = l->head;
    while (cur != NULL)
    {
        len++;
        cur = cur->next;
    }
    return len;
}

list concat(list l, list l0)
{
    node_t *cur = l0->head;
    while (cur != NULL)
    {
        l = addr(l, cur->elem);
        cur = cur->next;
    }
    return l;
}

list_elem index(list l, size_t n)
{
    assert(length(l) > n);
    node_t *cur = l->head;
    size_t i = 0;
    while (i < n)
    {
        cur = cur->next;
        i++;
    }
    return cur->elem;
}

list take(list l, size_t n)
{
    size_t i = 0;
    node_t *cur = l->head;
    while (i < n && cur != NULL)
    {
        cur = cur->next;
        i++;
    }

    node_t *to_free = cur;
    while (to_free != NULL)
    {
        node_t *temp = to_free;
        to_free = to_free->next;
        free(temp);
    }

    if (i == 0)
    {
        l->head = NULL;
    }
    else
    {
        node_t *prev = l->head;
        for (size_t j = 1; j < n; ++j)
        {
            prev = prev->next;
        }
        prev->next = NULL;
    }

    return l;
}

list drop(list l, size_t n)
{
    for (size_t i = 0; i < n && !is_empty(l); ++i)
    {
        l = tail(l);
    }
    return l;
}

list copy_list(list l1)
{
    list l2 = empty();
    node_t *cur = l1->head;

    list temp = empty();
    while (cur != NULL)
    {
        temp = addl(temp, cur->elem);
        cur = cur->next;
    }

    cur = temp->head;
    while (cur != NULL)
    {
        l2 = addl(l2, cur->elem);
        cur = cur->next;
    }

    destroy(temp);
    return l2;
}