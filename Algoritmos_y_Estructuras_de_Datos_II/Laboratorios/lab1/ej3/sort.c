#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static unsigned int partition(int a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = izq;
    unsigned int i = izq + 1;
    unsigned int j = der;

    while (i <= j) {
        if (a[i] <= a[ppiv]) {
            i++;
        } else if (a[j] > a[ppiv]) {
            j--;
        } else if (a[i] > a[ppiv] && a[j] < a[ppiv]) {
            swap(a, i,j);
            i++;
            j--;
        }
    }
    swap(a, ppiv, j);
    ppiv = j;
    return ppiv;
}

static void quick_sort_rec(int a[], unsigned int izq, unsigned int der)
{
    if (izq < der)
    {
        unsigned int pivot = partition(a, izq, der);

        if (pivot > izq)
        {
            quick_sort_rec(a, izq, pivot - 1);
        }

        if (pivot < der)
        {
            quick_sort_rec(a, pivot + 1, der);
        }
    }
}

void quick_sort(int a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

