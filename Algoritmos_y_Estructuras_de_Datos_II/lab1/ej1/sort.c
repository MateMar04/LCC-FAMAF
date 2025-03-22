#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static void insert(int a[], unsigned int i, unsigned int length) {
    int key = a[i];
    int j = i - 1;

    while (j >= 0 && a[j] > key) {
        swap(a, j, j + 1);
        j--;
    }
    a[j + 1] = key;
    array_dump(a, length);
}

void insertion_sort(int a[], unsigned int length) {
    for (unsigned int i = 1; i < length; ++i) {
        assert(array_is_sorted(a, i));
        insert(a, i, length);
    }
}
