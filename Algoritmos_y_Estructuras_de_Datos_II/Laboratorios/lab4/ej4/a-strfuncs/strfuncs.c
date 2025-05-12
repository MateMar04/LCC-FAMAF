#include <stdlib.h>
#include "strfuncs.h"

size_t string_length(const char *str) {
    size_t len = 0u;
    while (str[len] != '\0') {
        len++;
    }
    return len;
}

char *string_filter(const char *str, char c) {
    size_t len = string_length(str);

    // Primero contamos cuántos caracteres distintos de 'c' hay
    size_t count = 0u;
    for (size_t i = 0; i < len; i++) {
        if (str[i] != c) {
            count++;
        }
    }

    char *result = malloc((count + 1) * sizeof(char));

    // Llenamos la nueva cadena
    size_t j = 0u;
    for (size_t i = 0; i < len; i++) {
        if (str[i] != c) {
            result[j++] = str[i];
        }
    }

    result[j] = '\0';
    return result;
}

bool string_is_symmetric(const char *str) {
    size_t len = string_length(str);
    bool result = true;
    for (size_t i = 0u; i < len / 2; i++) {
        if (str[i] != str[len - 1 - i]) {
            result = false;
        }
    }
    return result;
}
