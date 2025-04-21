#include <stdio.h>
#include <stdbool.h>
#include "cima_log.h"

/**
 * @brief Dado un arreglo que tiene cima, devuelve la posición de la cima
 * usando la estrategia divide y venceras.
 *
 * Un arreglo tiene cima si existe una posición k tal que el arreglo es
 * estrictamente creciente hasta la posición k y estrictamente decreciente
 * desde la posición k.
 * La cima es el elemento que se encuentra en la posición k.
 * PRECONDICION: tiene_cima(a, length)
 *
 * @param a Arreglo.
 * @param length Largo del arreglo.
 */
int cima_log(int a[], int length) {

    if (length >= 2) {
        if (a[0] > a[1]) {
            return a[0];
        }
    } else if (a[length - 1] > a[length - 2]) {
        return a[length - 1];
    }
    
    int cima = cima_log_rec(a, 0, length - 1);
       
  
}

int cima_log_rec(int a[], int left, int right) {

    int mid = (left + right) / 2;
    
    int cima;

    if (a[mid] > a[mid + 1] && a[mid] > a[mid - 1]) {
        cima = a[mid];
    } else if (a[mid] < a[mid + 1] && a[mid] > a[mid - 1]) {
        return cima_log_rec(a, mid + 1, right);
    } else if (a[mid] > a[mid + 1] && a[mid] < a[mid - 1]) {
        return cima_log_rec(a, left, mid - 1);
    }
}