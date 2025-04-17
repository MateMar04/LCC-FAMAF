#include <stdio.h>
#include <stdbool.h>
#include "cima.h"

int maximo_idx(int a[], int length)
{
    int maximo = a[0];
    int idx = 0;

    for (int i = 1; i < length; i++)
    {
        if (a[i] > maximo)
        {
            maximo = a[i];
            idx = i;
        }
    }

    return idx;
}

bool check_ascendente(int a[], int max_idx, int max)
{
    bool subida = true;
    int i = 0;
    while ((i < max_idx) && subida)
    {
        if (a[i] >= max)
        {
            subida = false;
        }
        i++;
    }
    return subida;
}

bool check_decendente(int a[], int max_idx, int max)
{
    bool bajada = true;
    int i = 0;
    while ((i < max_idx) && bajada)
    {
        if (a[i] >= max)
        {
            bajada = false;
        }
        i++;
    }
    return bajada;
}

/**
 * @brief Indica si el arreglo tiene cima.
 *
 * Un arreglo tiene cima si existe una posición k tal que el arreglo es
 * estrictamente creciente hasta la posición k y estrictamente decreciente
 * desde la posición k.
 *
 * @param a Arreglo.
 * @param length Largo del arreglo.
 */
bool tiene_cima(int a[], int length)
{

    int max_idx = maximo_idx(a, length);
    int max = a[max_idx];
    bool subida = check_ascendente(a, max_idx, max);
    bool bajada = check_decendente(a, max_idx, max);
    bool cima = bajada && subida;

    return cima;
}

/**
 * @brief Dado un arreglo que tiene cima, devuelve la posición de la cima.
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
int cima(int a[], int length)
{

    int cima = -1;

    if (tiene_cima(a, length))
    {
        int max_idx = maximo_idx(a, length);
        int max = a[max_idx];
        bool subida = check_ascendente(a, max_idx, max);
        bool bajada = check_decendente(a, max_idx, max);

        

        if (subida && bajada)
        {
            cima = max;
        }
    }

    return cima;
}
