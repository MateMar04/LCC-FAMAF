#include <stdio.h>
#include <stdbool.h>

void ejercicio1()
{
    //  Declaración de variables
    int x, y, z;

    // Solicitar al usuario los valores de x, y, z
    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    printf("Ingrese el valor de z: ");
    scanf("%d", &z);

    // Calcular resultados
    printf("Resultado de x + y + 1 = %d\n", x + y + 1);
    printf("Resultado de z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);
    printf("Resultado de y-2 == (x*3+1) mod 5 = %d\n", y - 2 == (x * 3 + 1) % 5); // 0 == False y 1 == True
    printf("Resultado de y / 2 * x = %d\n", y / 2 * x);
    printf("Resultado de y < x * z = %d\n", y < x * z); // 0 == False y 1 == True

    // Para la ultima expresion el resultado es tipo int, 0 == False y 1 == True
}

void ejercicio3()
{
    int x;
    printf("Ingrese un valor x\n");
    scanf("%d", &x);
    x = 5;
    printf("%d\n", x);

    int a, b;
    printf("Ingrese valores para a y b (separados por espacio):\n");
    scanf("%d %d", &a, &b);
    a = a + b;
    b = b + b;
    printf("Resultados: a = %d, b = %d\n", a, b);

    int c, d;
    printf("Ingrese valores para c y d (separados por espacio):\n");
    scanf("%d %d", &c, &d);
    d = d + d;
    c = c + d;
    printf("Resultados: c = %d, d = %d\n", c, d);
}

void ejercicio5()
{
    int x, y;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    printf("Ingrese un valor y\n");
    scanf("%d", &y);

    if (x >= y)
    {
        x = 0;
    }
    else
    {
        x = 2;
    }

    printf("El resultado de x es: %d\n", x);
}

void ejercicio6()
{
    int x, y, z, m;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    printf("Ingrese un valor y\n");
    scanf("%d", &y);

    printf("Ingrese un valor z\n");
    scanf("%d", &z);

    printf("Ingrese un valor m\n");
    scanf("%d", &m);

    if (x < y)
    {
        m = x;
    }
    else if (x >= y)
    {
        m = y;
    }

    if (m < z)
    {
        ;
    }
    else if (m >= z)
    {
        m = z;
    }

    printf("El resultado de m es: %d\n", m);
}

void ejercicio7a()
{
    int i;

    printf("Ingrese un valor i\n");
    scanf("%d", &i);

    while (i != 0)
    {
        i--;
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio7b()
{
    int i;

    printf("Ingrese un valor i\n");
    scanf("%d", &i);

    while (i != 0)
    {
        i = 0;
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio7c()
{
    int i;

    printf("Ingrese un valor i\n");
    scanf("%d", &i);

    while (i < 0)
    {
        i--;
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio8a()
{
    int x, y;
    int i = 0;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    printf("Ingrese un valor y\n");
    scanf("%d", &y);

    while (x >= y)
    {
        x = x - y;
        i++;
        printf("El valor de x es: %d\n", x);
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio8b()
{
    int x;
    int i = 2;
    int res = true;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    while (i < x && res)
    {
        res = res && (x % i != 0);
        i++;
        printf("Res: %d\n", res);
        printf("i: %d\n", i);
    }
}

void ejercicio9a()
{
    int i = 0;
    int s = 0;

    const int array[4];

    printf("Ingrese el primer valor de la lista\n");
    scanf("%d", &array[0]);

    printf("Ingrese el segundo valor de la lista\n");
    scanf("%d", &array[1]);

    printf("Ingrese el tercer valor de la lista\n");
    scanf("%d", &array[2]);

    printf("Ingrese el cuarto valor de la lista\n");
    scanf("%d", &array[3]);

    while (i < 4)
    {
        s = s + array[i];
        i++;
    }
    printf("La suma de los elementos de la lista es %d \n", s);
}

void ejercicio9b()
{
    const int array[4];
    int i = 0;
    int c = 0;

    printf("Ingrese el primer valor de la lista\n");
    scanf("%d", &array[0]);

    printf("Ingrese el segundo valor de la lista\n");
    scanf("%d", &array[1]);

    printf("Ingrese el tercer valor de la lista\n");
    scanf("%d", &array[2]);

    printf("Ingrese el cuarto valor de la lista\n");
    scanf("%d", &array[3]);

    while (i < 4)
    {
        if (array[i] > 0)
        {
            c++;
        }
        else if (array[i] <= 0)
        {
        }
        i++;
    }
    printf("Hay %d numeros positivos\n", c);
}

void imprimir_hola(void)
{
    printf("Hola\n");
}

void imprimir_chau(void)
{
    printf("Chau\n");
}

int pedir_entero(char name)
{
    printf("Ingrese un valor entero para %c:\n ", name);
    int entero;
    scanf("%d", &entero);
    return entero;
}

void imprimir_entero(int x, char name)
{
    printf("El entero %c es %d\n", name, x);
}

bool pedir_booleano(char name)
{
    printf("Ingrese un valor booleano para %c:\n ", name);
    bool booleano;
    scanf("%d", &booleano);
    return booleano;
}

void imprimir_booleano(bool x, char name)
{
    printf("El booleano %c es %d\n", name, x);
}

/* Practico 4*/

void intercambio_de_variables()
{
    int x, y, z;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);

    z = x;
    x = y;
    y = z;

    printf("x = %d, y = %d\n", x, y);
}

void asignaciones_multiples_1()
{
    int x, y, a;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);

    a = x;
    x = x + 1;
    y = a + y;

    printf("x = %d, y = %d\n", x, y);
}

void asignaciones_multiples_2()
{
    int x, y, z, a, b;

    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    printf("Ingrese el valor de z: ");
    scanf("%d", &z);

    a = x;
    b = y;

    x = y;
    y = b + a + z;
    z = b + a;

    printf("x = %d, y = %d, z = %d\n", x, y, z);
}

// Falta Ejercicio 4

int suma_hasta(int n)
{
    int suma = 0;

    if (n < 0)
    {
        printf("El número ingresado es negativo\n");
        return -1;
    }

    while (n > 0)
    {
        suma += n;
        n--;
    }
    printf("El resultado de la suma es: %d\n", suma);
    return suma;
}

void pedir_arreglo(int n_max, int a[])
{
    printf("Ingrese los valores del arreglo: \n");
    for (int i = 0; i < n_max; i++)
    {
        printf("Elemento %d: ", i);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[])
{
    printf("El arreglo ingresado es: ");
    for (int i = 0; i < n_max; i++)
    {
        printf("%d", a[i]);
    }
    printf("\n");
}

/*
int n_max;
printf("Ingrese el tamaño del arreglo: \n");
scanf("%d", &n_max);

int a[n_max];

pedir_arreglo(n_max, a);

imprimir_arreglo(n_max, a);
 */

int main()
{
    int x, y;

    printf("Ingrese el dividendo (x): ");
    scanf("%d", &x);
    printf("Ingrese el divisor (y): ");
    scanf("%d", &y);

    struct div_t resultado = division(x, y);

    printf("El cociente es: %d\n", resultado.cociente);
    printf("El resto es: %d\n", resultado.resto);

    return 0;
}

struct div_t
{
    int cociente;
    int resto;
};
struct div_t division(int x, int y)
{
    struct div_t resultado;

    if (y == 0)
    {
        printf("No se puede dividir por 0\n");
        resultado.cociente = 0;
        resultado.resto = 0;
    }
    else
    {
        resultado.cociente = x / y;
        resultado.resto = x % y;
    }

    return resultado;
}

/*int x, y;

printf("Ingrese el dividendo (x): ");
scanf("%d", &x);
printf("Ingrese el divisor (y): ");
scanf("%d", &y);

struct div_t resultado = division(x, y);
*/

int sumatoria(int tam, int a[])
{
    int suma = 0;

    for (int i = 0; i < tam; i++)
    {
        suma += a[i];
    }

    printf("La sumatoria del arreglo es: %d\n", suma);
    return suma;
}

void intercambiar(int tam, int a[], int i, int j)
{
    if (i < 0 || i >= tam || j < 0 || j >= tam)
    {
        printf("Los índices ingresados no son válidos\n");
        return;
    }

    int aux = a[i];
    a[i] = a[j];
    a[j] = aux;
    printf("El arreglo intercambiado es: ");
    for (int k = 0; k < tam; k++)
    {
        printf("%d ", a[k]);
    }
}

/*int tam;

printf("Ingrese el tamaño del arreglo: \n");
scanf("%d", &tam);

int a[tam];

printf("Ingrese los valores del arreglo: \n");
for (int i = 0; i < tam; i++) {
    printf("Elemento %d: ", i);
    scanf("%d", &a[i]);
}

int i, j;

printf("Ingrese los indices a intercambiar: \n");
scanf("%d %d", &i, &j);

intercambiar(tam, a, i, j);*/

bool es_vocal(char letra)
{
    if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u')
    {
        printf("La letra ingresada %c es vocal\n", letra);
        return true;
    }
    printf("La letra ingresada %c no es vocal\n", letra);
    return false;
}

char pedir_char()
{
    char x;
    printf("Ingrese un caracter: ");
    scanf("%c", &x);
    return x;
}