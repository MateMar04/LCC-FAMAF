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

    show_list(my_list);

    return 0;
}
