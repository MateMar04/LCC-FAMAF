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

bool check_ascendente(int a[], int max_idx)
{
    bool subida = true;
    int i = 0;
    while ((i < max_idx - 1) && subida)
    {
        if (a[i] > a[i + 1])
        {
            subida = false;
        }
        i++;
    }
    return subida;
}

bool check_decendente(int a[], int max_idx)
{
    bool bajada = true;
    int i = 0;
    while ((i < max_idx - 1) && bajada)
    {
        if (a[i] > a[i + 1])
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
    bool subida = check_ascendente(a, max_idx);
    bool bajada = check_decendente(a, max_idx);
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

    int c = -1;

    if (tiene_cima(a, length))
    {
        int max_idx = maximo_idx(a, length);
        bool subida = check_ascendente(a, max_idx);
        bool bajada = check_decendente(a, max_idx);

                if (subida && bajada)
        {
            c = a[max_idx];
        }
    }

    return c;
}
