/* weather_utils.c */
#include <limits.h>
#include "weather_utils.h"
#include "weather_table.h"

int lowest_min_temp(Weather weather[YEARS][MONTHS][DAYS]) {
    int min = INT_MAX;
    for (int y = 0; y < YEARS; y++) {
        for (int m = 0; m < MONTHS; m++) {
            for (int d = 0; d < DAYS; d++) {
                if (weather[y][m][d]._min_temp < min) {
                    min = weather[y][m][d]._min_temp;
                }
            }
        }
    }
    return min;
}

int highest_max_temp(Weather weather[YEARS][MONTHS][DAYS]) {
    
    int result [YEARS];
    
    for (int y = 0; y < YEARS; y++) {
        int max_t = weather[y][0][0]._max_temp;
        for (int m = 0; m < MONTHS; m++) {
            for (int d = 0; d < DAYS; d++) {
                if (weather[y][m][d]._max_temp > max_t) {
                    max_t = weather[y][m][d]._max_temp;
                }
            }
        }
        result[y] = max_t;
    }
    return result;
}

int sum_month_rainfall(Weather weather[YEARS][MONTHS][DAYS], int y, int m) {
    int sum = 0;
    for (int d = 0; d < DAYS; d++) {
        sum += weather[y][m][d]._rainfall;
    }
    return sum;
}

int max_month_rainfall_by_year(Weather weather[YEARS][MONTHS][DAYS]) {
    
    int result [YEARS];
    
    for (int y = 0; y < YEARS; y++) {
        int best_m = 0;
        int best_rain = sum_month_rainfall(weather, y, 0);
        for (int m = 1; m < MONTHS; m++) {
            int r = sum_month_rainfall(weather, y, m);
            if (r > best_rain) {
                best_rain = r;
                best_m = m;
            }
        }
        result[y] = best_m;
    }

    return result;
}