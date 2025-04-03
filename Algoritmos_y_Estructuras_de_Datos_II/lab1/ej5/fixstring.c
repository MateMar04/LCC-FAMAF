#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"


unsigned int fstring_length(fixstring s) {
    unsigned int counter = 0;

    while (s[counter] != '\0') {
        counter++;
    }

    return counter;
}

bool fstring_eq(fixstring s1, fixstring s2) {
    unsigned int counter = 0;
    while (s1[counter] == s2[counter] && s1[counter] != '\0') {
        counter++;
    }
    bool sonIguales = (s1[counter] == s2[counter]);
    return sonIguales;
}

bool fstring_less_eq(fixstring s1, fixstring s2) {
    unsigned int counter = 0;
    while (s1[counter] != '\0' && s2[counter] != '\0' && s1[counter] == s2[counter]) {
        counter++;
    }

    bool resultado = (s1[counter] <= s2[counter]);
    return resultado;
}

void fstring_set(fixstring s1, const fixstring s2) {
    int i=0;
    while (i<FIXSTRING_MAX && s2[i]!='\0') {
        s1[i] = s2[i];
        i++;
    }
    s1[i] = '\0';
}

void fstring_swap(fixstring s1, fixstring s2) {
    fixstring aux;
    fstring_set(aux, s1);
    fstring_set(s1, s2);
    fstring_set(s2, aux);
}


