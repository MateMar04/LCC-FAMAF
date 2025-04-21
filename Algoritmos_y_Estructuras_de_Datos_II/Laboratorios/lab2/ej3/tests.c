#include <stdbool.h>
#include <stdio.h>
#include "cima_log.h"

#define MAX_LENGTH 10
#define N_TESTCASES_CIMA 10

int main() {
    struct testcase {
        int a[MAX_LENGTH];
        int length;
        int result;
    };

    struct testcase tests[N_TESTCASES_CIMA] = {
        {{8}, 1, true},
        {{1, 2, 4, 4, 5}, 5, false},
        {{5, 4, 3, 2, 1}, 5, true},
        {{1, 2, 3, 4, 5, 4}, 6, true},
        {{1, 2, 3, 4, 5, 6}, 6, true},
        {{6, 5, 4, 3, 2}, 5, true},
        {{1, 2, 3, 4, 5, 4}, 6, true},
        {{1}, 1, true},
        {{-1}, 1, true},
        {{-1, -2, -3, -4, -5}, 5, true}

    };
    int result;

    printf("TESTING cima\n");

    for (int i=0; i < N_TESTCASES_CIMA; i++) {
        printf("Test case %i: ", i+1);

        result = cima_log(tests[i].a, tests[i].length);

        if (result == tests[i].result) {
            printf("OK\n");
        } else {
            printf("FAILED. got %d expected %d\n", result, tests[i].result);
        }
    }

    return 0;
}
