/*
  @file layover.c
  @brief Implements flight structure and methods
*/
#include <stdlib.h>
#include "flight.h"

static const int AMOUNT_OF_FLIGHT_VARS = 3 ;

Flight flight_from_file(FILE* file, char code)
{
    Flight flight;
    flight.code = code;

    int data = fscanf(file, "%u %u %u\n", &flight.type, &flight.hour, &flight.passengers_amount);
    if (data != AMOUNT_OF_FLIGHT_VARS)
    {
        fprintf(stderr, "Error: invalid flight data format\n");
        exit(EXIT_FAILURE);
    }

    return flight;
}
