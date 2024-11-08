#include <stdio.h>
#include <assert.h>

#define N 5

int max_init(int tam, int a[], int n)
{
    // Compruebo que n este en el rango del arreglo
    assert(n > 0 && n <= tam);

    int i = 0;

    // Establezco el primer elemento del arreglo como minimo
    int max = a[0];
    while (i < n)
    {
        if (max < a[i])
        {
            max = a[i];
        }
        i++;
    }

    return max;
}

int main()
{
    // declaracion del arreglo de longitud N
    int a[N];
    
    // contador
    int i = 0;
    
    printf("Ingrese los valores del arreglo \n");
    while (i < N)
    {
        printf("Ingrese el elemento en la posicion %d: ", i);
        scanf("%d", &a[i]);
        i++;
    }

    int n;
    printf("Ingrese un numero n (mayor a cero pero menor o igual a N): ");
    scanf("%d", &n);

    // Llamada a la funcion
    int maximo = max_init(N, a, n);
    printf("El valor maximo en las primeras %d posiciones es: %d \n", n, maximo);
}
