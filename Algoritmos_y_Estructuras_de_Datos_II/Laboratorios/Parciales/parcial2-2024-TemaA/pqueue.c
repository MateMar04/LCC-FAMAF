#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "character/character.h"
#include "pqueue.h"

/* ============================================================================
STRUCTS
============================================================================ */

struct s_node {
    Character      elem;      /* Personaje almacenado               */
    float          priority;  /* Valor de iniciativa calculado      */
    struct s_node *next;      /* Siguiente nodo en la cola          */
};

struct s_pqueue {
    struct s_node *front;     /* Primer nodo (mayor prioridad)      */
    unsigned int   size;      /* Cantidad de elementos en la cola   */
};

/* ============================================================================
INVARIANTE DE REPRESENTACIÓN
============================================================================ */

static bool invrep(pqueue q)
{
    if (q == NULL) {
        return false;    /* Una cola válida nunca es NULL */
    }

    /* ---- Contar nodos y comprobar size ---- */
    unsigned int count = 0u;
    for (struct s_node *curr = q->front; curr != NULL; curr = curr->next) {
        ++count;
    }

    assert(count == q->size);

    return true;
}

/* ============================================================================
FUNCIÓN AUXILIAR: CÁLCULO DE PRIORIDAD
============================================================================ */

static float calculate_priority(Character character)
{
    float base = (float) character_agility(character);

    /* factor según si el personaje está vivo */
    float alive_factor;
    if (character_is_alive(character)) {
        alive_factor = 1.0f;
    } else {
        alive_factor = 0.0f;
    }

    /* modificador según el tipo de personaje */
    float modifier = 1.0f;
    charttype_t ctype = character_ctype(character);

    if (ctype == agile) {
        modifier = 1.5f;          /* +50 % */
    } else if (ctype == tank) {
        modifier = 0.8f;          /* −20 % */
    } else {
        /* physical o magic → 1.0f */
        modifier = 1.0f;
    }

    return base * modifier * alive_factor;
}

/* ============================================================================
FUNCIÓN AUXILIAR: CREACIÓN DE NODO
============================================================================ */

static struct s_node *create_node(Character character)
{
    struct s_node *node = malloc(sizeof(struct s_node));
    assert(node != NULL);

    node->elem     = character_copy(character);
    node->priority = calculate_priority(character);
    node->next     = NULL;

    return node;
}

/* ============================================================================
CONSTRUCTOR
============================================================================ */

pqueue pqueue_empty(void)
{

    pqueue q = malloc(sizeof(struct s_pqueue));
    assert(q != NULL);

    q->front = NULL;
    q->size  = 0u;

    /* Post: q válido y vacío */
    assert(invrep(q));
    assert(pqueue_is_empty(q));

    return q;
}

/* ============================================================================
ENQUEUE
============================================================================ */

pqueue pqueue_enqueue(pqueue q, Character character)
{

    assert(q != NULL);
    assert(invrep(q));

    struct s_node *new_node = create_node(character);

    /* Caso 1: cola vacía */
    if (q->front == NULL) {
        q->front = new_node;
    }
    /* Caso 2: nueva mayor prioridad → insertar al frente */
    else if (new_node->priority > q->front->priority) {
        new_node->next = q->front;
        q->front       = new_node;
    }
    /* Caso 3: buscar posición adecuada manteniendo orden */
    else {
        struct s_node *prev = q->front;
        struct s_node *curr = q->front->next;

        while (curr != NULL && curr->priority >= new_node->priority) {
            prev = curr;
            curr = curr->next;
        }

        new_node->next = curr;
        prev->next     = new_node;
    }

    ++(q->size);

    assert(invrep(q));
    assert(!pqueue_is_empty(q));

    return q;
}

/* ============================================================================
ESTADO DE LA COLA
============================================================================ */

bool pqueue_is_empty(pqueue q)
{
    assert(q != NULL);
    assert(invrep(q));

    return q->size == 0u;
}

/* ============================================================================
PEEK
============================================================================ */

Character pqueue_peek(pqueue q)
{
    assert(q != NULL);
    assert(invrep(q));
    assert(!pqueue_is_empty(q));

    Character top = q->front->elem;

    assert(invrep(q));
    return top;
}

float pqueue_peek_priority(pqueue q)
{
    assert(q != NULL);
    assert(invrep(q));
    assert(!pqueue_is_empty(q));

    float prio = q->front->priority;

    assert(invrep(q));
    return prio;
}

/* ============================================================================
SIZE
============================================================================ */

unsigned int pqueue_size(pqueue q)
{
    assert(q != NULL);
    assert(invrep(q));
    return q->size;
}

/* ============================================================================
COPY
============================================================================ */

pqueue pqueue_copy(pqueue q)
{
    assert(q != NULL);
    assert(invrep(q));

    pqueue copy = pqueue_empty();

    /* Copiar elementos en orden */
    struct s_node *curr = q->front;
    while (curr != NULL) {
        copy = pqueue_enqueue(copy, curr->elem);
        curr = curr->next;
    }

    assert(invrep(copy));
    return copy;
}

/* ============================================================================
DEQUEUE Y DESTRUCTOR DE NODO
============================================================================ */

static struct s_node *destroy_node(struct s_node *node)
{
    assert(node != NULL);

    node->elem = character_destroy(node->elem);
    free(node);
    return NULL;
}

pqueue pqueue_dequeue(pqueue q)
{
    assert(q != NULL);
    assert(invrep(q));
    assert(!pqueue_is_empty(q));

    struct s_node *first = q->front;
    q->front = first->next;

    first = destroy_node(first);
    --(q->size);

    assert(invrep(q));
    return q;
}

/* ============================================================================
DESTRUCTOR COMPLETO
============================================================================ */

pqueue pqueue_destroy(pqueue q)
{
    if (q == NULL) {
        return NULL;
    }

    assert(invrep(q));

    while (!pqueue_is_empty(q)) {
        q = pqueue_dequeue(q);
    }

    free(q);
    q = NULL;

    assert(q == NULL);
    return q;
}
