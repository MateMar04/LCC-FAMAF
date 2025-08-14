#include <stdio.h>
#include <stdlib.h>
#include "walk.h"
#include <assert.h>


#define STEP_NORTH 0
#define STEP_EAST 1
#define STEP_NORTHEAST 2
#define STEP_UNDEF 3

typedef unsigned int step_t;
typedef unsigned int uint_t;

struct _node_t {
    step_t step;
    struct _node_t *next;
};

typedef struct _node_t *node_t;

struct _walk_t {
    node_t init;
    node_t last;
    uint_t length;
    uint_t width;
    uint_t height;
};

walk_t walk_empty(void) {
    walk_t walk = malloc(sizeof(struct _walk_t));
    assert(walk != NULL);
    
    walk->init = NULL;
    walk->last = NULL;
    walk->length = 0;
    walk->width = 0;
    walk->height = 0;

    return walk;
}

static node_t create_node(void){
    node_t new_node = malloc(sizeof(struct _node_t));
    assert(new_node != NULL);
    new_node->step = STEP_UNDEF; 
    new_node->next = NULL;
    return new_node;
}

static walk_t walk_add(walk_t walk , node_t new_node) {
    assert(walk != NULL);
    assert(new_node != NULL);

    if (walk->init == NULL) {
        walk->init = new_node;
        walk->last = new_node;
    } else {
        walk->last->next = new_node;
        walk->last = new_node;
    }

    walk->length++;
    return walk;
}

walk_t walk_north(walk_t walk) {
    assert(walk != NULL);
    
    node_t new_node = create_node();
    new_node->step = STEP_NORTH;

    walk = walk_add(walk, new_node);

    walk->height++;
    return walk;
}

walk_t walk_east(walk_t walk) {
    assert(walk != NULL);
    
    node_t new_node = create_node();
    new_node->step = STEP_EAST;

    walk = walk_add(walk, new_node);

    walk->width++;
    return walk;
}

walk_t walk_northeast(walk_t walk) {
    assert(walk != NULL);
    
    node_t new_node = create_node();
    new_node->step = STEP_NORTHEAST;

    walk = walk_add(walk, new_node);

    walk->width++;
    walk->height++;
    return walk;
}

unsigned int walk_length(walk_t walk) {
    assert(walk != NULL);
    return walk->length;
}

unsigned int walk_height(walk_t walk) {
    assert(walk != NULL);
    return walk->height;
}

unsigned int walk_width(walk_t walk) {
    assert(walk != NULL);
    return walk->width;
}

walk_t walk_extend(walk_t walk, unsigned int east, unsigned int north) {
    assert(walk != NULL);
    for (unsigned int i = 0; i < north; i++) {
        walk = walk_east(walk);
    }
    for (unsigned int i = 0; i < east; i++) {
        walk = walk_north(walk);
    }
    return walk;
}

static char step_to_char (step_t step) {
    char c = '\0';
    switch (step) {
        case STEP_NORTH : c = 'N'; break;
        case STEP_EAST  : c = 'E' ; break;
        case STEP_NORTHEAST : c = 'X' ; break;
        default : c = 'U' ; break;
    }
    return c;
}

void walk_dump(walk_t walk) {
    assert(walk != NULL);
    node_t current = NULL;
    current = walk -> init;
    printf("[");
    while (current != NULL) {
        printf("%c",step_to_char(current->step));
        if(current->next != NULL) {
            printf(" -> ");
        }
        current = current -> next;
    }
    printf("] (L=%u,W=%u,H=%u)\n",walk->length,walk->width,walk->height);
}

walk_t walk_destroy(walk_t walk) {
    
    assert(walk != NULL);
    node_t current = walk->init;
    node_t next_node = NULL;
    while (current != NULL) {
        next_node = current->next;
        free(current);
        current = next_node;
    }
    free(walk);
    walk = NULL;
    assert(walk == NULL);
    return(walk);
}

