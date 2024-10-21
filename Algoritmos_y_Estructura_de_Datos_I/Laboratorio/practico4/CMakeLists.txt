cmake_minimum_required(VERSION 3.29)
project(practico4)

set(CMAKE_CXX_STANDARD 20)

add_executable(practico4 main.c
        vocales.c
        vocales.h
        intercambio_arreglos.c
        intercambio_arreglos.h
        sumatoria.c
        sumatoria.h)
