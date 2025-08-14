#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>
#include "counter.h"

struct _counter
{
    unsigned int count;
};

counter counter_init(void)
{
    counter c = malloc(sizeof(struct _counter));
    if (c == NULL)
    {
        return NULL;
    }
    c->count = 0;
    return c;
}

void counter_inc(counter c)
{
    c->count++;
}

bool counter_is_init(counter c)
{
    if (c->count == 0)
    {
        return true;
    }
    return false;
}

void counter_dec(counter c)
{
    assert(!counter_is_init(c));
    c->count--;
}

counter counter_copy(counter c)
{
    counter new_counter = malloc(sizeof(struct _counter));
    if (new_counter == NULL)
    {
        return NULL;
    }
    new_counter->count = c->count;
    return new_counter;
}

void counter_destroy(counter c)
{
    free(c);
    c = NULL;
}
