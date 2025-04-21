/*
  @file weather.c
  @brief Implements weather mesuarement structure and methods
*/
#include <stdlib.h>
#include "weather.h"

Weather weather_from_file(FILE *file)
{
  Weather w;
  unsigned int year, month, day;
  int avg, max, min;
  unsigned int press, moist, rain;

  // Leemos las 9 columnas: año, mes, día, temp_prom, temp_max, temp_min, presión, humedad, precipitaciones
  int scanned = fscanf(file,
                       " %u %u %u  " // año mes día
                       "%d %d %d  "  // temp_media temp_max temp_min
                       "%u %u %u",   // presión humedad precipitaciones
                       &year, &month, &day,
                       &avg, &max, &min,
                       &press, &moist, &rain);
  if (scanned != 9)
  {
    fprintf(stderr, "Error: formato de línea meteorológica inválido (se esperaban 9 campos, leídos %d)\n",
            scanned);
    exit(EXIT_FAILURE);
  }

  w._average_temp = avg;
  w._max_temp = max;
  w._min_temp = min;
  w._pressure = press;
  w._moisture = moist;
  w._rainfall = rain;

  return w;
}

void weather_to_file(FILE *file, Weather weather)
{
  fprintf(file, "%d %d %d %u %u %u", weather._average_temp,
          weather._max_temp, weather._min_temp, weather._pressure, weather._moisture, weather._rainfall);
}
