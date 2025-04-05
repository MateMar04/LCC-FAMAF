#include <stdbool.h>
#include "k_esimo.h"

// FUNCIONES INTERNAS DEL MÓDULO:
int partition(int a[], int izq, int der);
bool goes_before(int x, int y);
void swap(int a[], int i, int j);

/**
 * @brief K-esimo elemento mas chico del arreglo a.
 *
 * Devuelve el elemento del arreglo `a` que quedaría en la celda `a[k]` si el
 * arreglo estuviera ordenado. La función puede modificar el arreglo.
 * Dicho de otra forma, devuelve el k-esimo elemento mas chico del arreglo a.
 *
 * @param a Arreglo.
 * @param length Largo del arreglo.
 * @param k Posicion dentro del arreglo si estuviera ordenado.
 */
int k_esimo(int a[], int length, int k) {
    int izq = 0;
    int der = length - 1;
    int ppiv;
    int kesimo = -1;
    
    
    while (izq <= der) {
        ppiv = partition(a, izq, der);

        printf("izq: %d, der: %d, pivot pos: %d, pivot: %d\n", izq, der, ppiv, a[ppiv]);
        printf("Arreglo: ");
        for (int i = 0; i < length; i++) {
            printf("%d ", a[i]);
        }
        printf("\n\n");
        
        if (ppiv == k) {
            kesimo = a[ppiv];
        }
        else if (k < ppiv) {
            der = ppiv - 1;
        }
        else {
            izq = ppiv + 1;
        }
    }
    
    return kesimo;
}

int partition(int a[], int izq, int der) {
    int i, j, ppiv;
    ppiv = izq;
    i = izq + 1;
    j = der;
    while (i <= j) {
        if (goes_before(a[i], a[ppiv])) {
            i = i + 1;
        } else if (goes_before(a[ppiv], a[j])) {
            j = j - 1;
        } else {
            swap(a, i, j);
        }
    }

    swap(a, ppiv, j);
    ppiv = j;

    return ppiv;
}

bool goes_before(int x, int y) {
    return x <= y;
}

void swap(int a[], int i, int j) {
    int tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
}
