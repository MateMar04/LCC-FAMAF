#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "fixstring.h"

void swap(fixstring a[], unsigned int i, unsigned int j) {
    fixstring aux;
    fstring_set(aux, a[i]);
    fstring_set(a[i], a[j]);
    fstring_set(a[j], aux);
}

bool goes_before(fixstring x, fixstring y) {
    unsigned int i = 0;
    bool result = false;
    bool decided = false;
    
    while (!decided) {
        if (x[i] == '\0' && y[i] == '\0') {
            result = false;
            decided = true;

        } else if (x[i] == '\0' && y[i] != '\0') {
            result = true;
            decided = true;

        } else if (y[i] == '\0' && x[i] != '\0') {
            result = false;
            decided = true;

        } else if (x[i] < y[i]) {
            result = true;
            decided = true;

        } else if (x[i] > y[i]) {
            result = false;
            decided = true;
            
        } else {
            i++;
        }
    }
    
    return result;
}


bool array_is_sorted(fixstring array[], unsigned int length) {
    unsigned int i = 1;
    while (i < length && goes_before(array[i-1], array[i])) {
        i++;
    }
    return (i >= length);
}

