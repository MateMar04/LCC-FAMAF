#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#define ARRAY_SIZE 4

struct bound_data
{
    bool is_upperbound;
    bool is_lowerbound;
    bool exists;
    unsigned int where;
};

bool is_min(int value, int arr[], unsigned int length)
{
    bool min = true;
    if (length != 0)
    {
        unsigned int i = 0;
        while (min && i < length)
        {
            if (arr[i] < value)
            {
                min = false;
            }
            i++;
        }
    }
    return min;
}

bool is_max(int value, int arr[], unsigned int length)
{
    bool max = true;
    if (length != 0)
    {
        unsigned int i = 0;
        while (max && i < length)
        {
            if (arr[i] > value)
            {
                max = false;
            }
            i++;
        }
    }
    return max;
}

bool exists_in(int value, int arr[], unsigned int length)
{
    bool exists = false;
    unsigned int i = 0;
    if (length != 0)
    {
        while (!exists && i < length)
        {
            if (arr[i] == value)
            {
                exists = true;
            }
            i++;
        }
    }
    return exists;
}

int where_is(int value, int arr[], unsigned int length)
{
    int where = -1;
    unsigned int i = 0;
    if (length != 0)
    {
        while (i < length)
        {
            if (value == arr[i])
            {
                where = i;
            }
            i++;
        }
    }
    return where;
}

struct bound_data check_bound(int value, int arr[], unsigned int length)
{
    struct bound_data res;

    res.is_upperbound = is_max(value, arr, length);
    res.is_lowerbound = is_min(value, arr, length);
    res.exists = exists_in(value, arr, length);
    res.where = where_is(value, arr, length);

    return res;
}

int main(void)
{
    int a[ARRAY_SIZE];
    int value;

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("Ingrese el valor %d: ", i);
        scanf("%d", &a[i]);
    }

    printf("Ingrese el valor a chequear: ");
    scanf("%d", &value);

    struct bound_data result = check_bound(value, a, ARRAY_SIZE);

    printf("\n----------------------\n\n");
    printf("Is upperbound: %d\n", result.is_upperbound);
    printf("Is lowerbound: %d\n", result.is_lowerbound);
    printf("Exists: %d\n", result.exists);
    printf("Where: %d\n", result.where);

    return EXIT_SUCCESS;
}
