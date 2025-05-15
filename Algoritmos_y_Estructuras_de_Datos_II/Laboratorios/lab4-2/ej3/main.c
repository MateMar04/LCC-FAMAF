#include <stdio.h>
#include <stdlib.h>
#define LINKED_LIST_SIZE 3

typedef struct Node {
    int data;
    struct Node* next;
} Node;

typedef Node *List;

/**
 * @brief Construye y devuelve una lista de ejemplo de 3 elementos
 */
List setup_example() {
        int i = LINKED_LIST_SIZE;

    // Crear primer nodo
    List my_list = malloc(sizeof(Node));

    Node *a_node = my_list;
    i--;

    while (i > 0) {
        a_node->data = i * 10;

        // Reservar memoria para el siguiente nodo
        a_node->next = malloc(sizeof(Node));

        a_node = a_node->next;
        i--;
    }

    // Último nodo
    a_node->data = 0;
    a_node->next = NULL;

    return my_list;
}

/**
 * @brief Agrega un elemento de ejemplo al final de la lista
 *
 * Precondicion: la lista xs no debe ser vacía
 */
void append_example(List xs) {
    // Crear nuevo nodo
    Node *new_node = malloc(sizeof(Node));
    new_node->data = 88;
    new_node->next = NULL;

    // Ir al final de la lista
    while (xs->next != NULL) {
        xs = xs->next;
    }

    // Agregar el nuevo nodo al final
    xs->next = new_node;
}

void show_list(List xs) {
    printf("[ ");
    while (xs != NULL) {
        printf("%i, ", xs->data);
        xs = xs->next;
    }
    printf("]\n");
}

int main(void) {
    List my_list;

    my_list = setup_example();

    printf("Lista antes del append: ");

    show_list(my_list);

    append_example(my_list);

    printf("Lista después del append: ");

    show_list(my_list);

    return 0;
}
