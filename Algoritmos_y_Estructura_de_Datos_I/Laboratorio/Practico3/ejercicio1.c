#include <stdio.h>
#include <stdbool.h>
#include "entradas.h"
#include "entradas_bool.h"
#include "saludos.h"

void ejercicio1() {
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

void ejercicio3() {
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

void ejercicio5() {
    int x, y;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    printf("Ingrese un valor y\n");
    scanf("%d", &y);

    if (x >= y) {
        x = 0;
    } else {
        x = 2;
    }

    printf("El resultado de x es: %d\n", x);
}

void ejercicio6() {
    int x, y, z, m;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    printf("Ingrese un valor y\n");
    scanf("%d", &y);

    printf("Ingrese un valor z\n");
    scanf("%d", &z);

    printf("Ingrese un valor m\n");
    scanf("%d", &m);

    if (x < y) {
        m = x;
    } else if (x >= y) {
        m = y;
    }

    if (m < z) {
        ;
    } else if (m >= z) {
        m = z;
    }

    printf("El resultado de m es: %d\n", m);
}

void ejercicio7a() {
    int i;

    printf("Ingrese un valor i\n");
    scanf("%d", &i);

    while (i != 0) {
        i--;
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio7b() {
    int i;

    printf("Ingrese un valor i\n");
    scanf("%d", &i);

    while (i != 0) {
        i = 0;
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio7c() {
    int i;

    printf("Ingrese un valor i\n");
    scanf("%d", &i);

    while (i < 0) {
        i--;
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio8a() {
    int x, y;
    int i = 0;

    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    printf("Ingrese un valor y\n");
    scanf("%d", &y);

    while (x >= y) {
        x = x - y;
        i++;
        printf("El valor de x es: %d\n", x);
        printf("El valor de i es: %d\n", i);
    }
}

void ejercicio8b() {
    int x;
    int i = 2;
    int res = true;


    printf("Ingrese un valor x\n");
    scanf("%d", &x);

    while (i < x && res) {
        res = res && (x % i != 0);
        i++;
        printf("Res: %d\n", res);
        printf("i: %d\n", i);
    }
}

void ejercicio9a() {
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

    while (i < 4) {
        s = s + array[i];
        i++;
    }
    printf("La suma de los elementos de la lista es %d \n", s);
}

void ejercicio9b() {
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

    while (i < 4) {
        if (array[i] > 0) {
            c++;
        } else if (array[i] <= 0) {
        }
        i++;
    }
    printf("Hay %d numeros positivos\n", c);
}

int main() {
    imprimir_entero(pedir_entero('n'), 'n');
    imprimir_booleano(pedir_booleano('m'), 'm');
    imprimir_hola();
    imprimir_chau();
    imprimir_chau();


}
