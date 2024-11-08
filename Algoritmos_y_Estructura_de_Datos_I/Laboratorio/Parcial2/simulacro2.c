#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>

struct info_t
{
    int op_sum;  // Guarda la suma
    int op_mul;  // Guarda la multiplicación
    int op_div;  // Guarda la división entera
    int op_dist; // Guarda el valor absoluto de la resta
};

struct info_t operar(int x, int y)
{
    struct info_t res;

    res.op_sum = x + y;
    res.op_mul = x * y;
    res.op_div = x / y;
    res.op_dist = abs(x - y);

    return res;
}

typedef struct
{
    int cant_v;
    int cant_pares;
    int cant_imp;
    bool hay_8;

} datos;

datos llenar_estructura(int a[], int tam, int v)
{

    datos datos;
    datos.cant_v = 0;
    datos.cant_pares = 0;
    datos.cant_imp = 0;
    datos.hay_8 = false;

    int i = 0;

    while (i < tam)
    {
        if (a[i] == v){
            datos.cant_v++;
        }
        if (a[i] % 2 == 0){
            datos.cant_pares++;
        }
        else{
            datos.cant_imp++;
        }
        if (a[i] == 8){
            datos.hay_8 = true;
        }
        i++;
    }

    return datos;
}

int main()
{
    /*int a, b;

    printf("Ingrese el numero a:\n");
    scanf("%d", &a);
    printf("Ingrese el numero b:\n");
    scanf("%d", &b);

    assert(b > 0 && a > 0 && a > b);

    operar(a, b);*/

    int v;
    printf("Ingrese el valor v: ");
    scanf("%d", &v);

    int a[5];

    printf("Ingrese los valores del arreglo: \n");
    for (int i = 0; i < 5; i++)
    {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
    }

    datos res = llenar_estructura(a, 5, v);

    printf("La cantidad de veces que aparece el valor v es: %d\n", res.cant_v);
    printf("La cantidad de numeros pares es: %d\n", res.cant_pares);
    printf("La cantidad de numeros impares es: %d\n", res.cant_imp);
    printf("Hay un 8 en el arreglo: %d\n", res.hay_8);

}