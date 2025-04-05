#include <stdbool.h>
#include <stdio.h>
#include "k_esimo.h"

// FUNCIONES INTERNAS DEL MÓDULO:
int partition(int a[], int lft, int rgt);
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
    int lft = 0;
    int rgt = length - 1;
    int ppiv;
    int kesimo = -1;
    bool found = false;
    
    
    while (lft <= rgt && !found) {
        ppiv = partition(a, lft, rgt);

        printf("lft: %d, rgt: %d, pivot pos: %d, pivot: %d\n", lft, rgt, ppiv, a[ppiv]);
        printf("Arreglo: ");
        for (int i = 0; i < length; i++) {
            printf("%d ", a[i]);
        }
        printf("\n\n");
        
        if (ppiv == k) {
            kesimo = a[ppiv];
            found = true;
        }
        else if (k < ppiv) {
            rgt = ppiv - 1;
        }
        else {
            lft = ppiv + 1;
        }
    }
    
    return kesimo;
}

int partition(int a[], int lft, int rgt) {
    int i, j, ppiv;
    ppiv = lft;
    i = lft + 1;
    j = rgt;
    while (i <= j) {
        if (goes_before(a[i], a[ppiv])) {
            i = i + 1;
        } else if (goes_before(a[ppiv], a[j])) {
            j = j - 1;
        } else {
            swap(a, i, j);
            i = i + 1;
            j = j - 1;
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
