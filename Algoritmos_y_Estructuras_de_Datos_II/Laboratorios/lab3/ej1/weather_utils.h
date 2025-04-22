#ifndef WEATHER_UTILS_H
#define WEATHER_UTILS_H

#include "weather_table.h"

/**
 * Devuelve la temperatura mínima registrada
 * en todo el período (años × meses × días).
 */
int lowest_min_temp(Weather weather[YEARS][MONTHS][DAYS]);

/**
 * Devuelve, para cada año, la temperatura máxima registrada.
 * Según tu implementación, retorna un entero (aunque el código actual
 * almacena un array interno; quizá necesites ajustar la firma si quieres
 * devolver el array completo).
 */
void highest_max_temp(Weather weather[YEARS][MONTHS][DAYS], int output[YEARS]);

/**
 * Suma la precipitación de un mes dado (year, month).
 */
int sum_month_rainfall(Weather weather[YEARS][MONTHS][DAYS],
                       int year,
                       int month);

/**
 * Para cada año, calcula el mes con más lluvia.
 * La implementación actual lo guarda en un array interno;
 */
void max_month_rainfall_by_year(Weather weather[YEARS][MONTHS][DAYS], int output[YEARS]);

#endif /* WEATHER_UTILS_H */
