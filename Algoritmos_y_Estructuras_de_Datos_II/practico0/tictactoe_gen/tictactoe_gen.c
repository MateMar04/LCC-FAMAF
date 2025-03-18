#include <stdlib.h>  /* exit() y EXIT_FAILURE */
#include <stdio.h>   /* printf(), scanf()     */
#include <stdbool.h> /* Tipo bool             */

#include <assert.h>  /* assert() */

#define N 4

#define CELL_MAX (N * N - 1)


struct coord
{
    int x;
    int y;
};


void print_sep(int length) {
    printf("\t ");
    for (int i=0; i < length;i++) printf("................");
    printf("\n");

}

void print_board(char board[N][N])
{
    int cell = 0;

    print_sep(N);
    for (int row = 0; row < N; ++row) {
        for (int column = 0; column < N; ++column) {
            printf("\t | %d: %c ", cell, board[row][column]);
            ++cell;
        }
        printf("\t | \n");
        print_sep(N);
    }
}

char get_winner(char board[N][N])
{
    char winner = '-';

    // Revisa filas
    for (int i = 0; i < N && winner == '-'; i++) {
        if (board[i][0] != '-') {
            bool allSame = true;
            for (int j = 1; j < N && allSame; j++) {
                allSame = (board[i][j] == board[i][0]);
            }
            if (allSame) {
                winner = board[i][0];
            }
        }
    }

    // Revisa columnas
    for (int j = 0; j < N && winner == '-'; j++) {
        if (board[0][j] != '-') {
            bool allSame = true;
            for (int i = 1; i < N && allSame; i++) {
                allSame = (board[i][j] == board[0][j]);
            }
            if (allSame) {
                winner = board[0][j];
            }
        }
    }

    // Revisa la diagonal principal
    if (winner == '-' && board[0][0] != '-') {
        bool allSame = true;
        for (int i = 1; i < N && allSame; i++) {
            allSame = (board[i][i] == board[0][0]);
        }
        if (allSame) {
            winner = board[0][0];
        }
    }

    // Revisa la diagonal secundaria
    if (winner == '-' && board[0][N-1] != '-') {
        bool allSame = true;
        for (int i = 1; i < N && allSame; i++) {
            allSame = (board[i][N-1-i] == board[0][N-1]);
        }
        if (allSame) {
            winner = board[0][N-1];
        }
    }

    return winner;
}

bool has_free_cell(char board[N][N])
{
    bool free_cell=false;

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (board[i][j] == '-')
            {
                free_cell = true;
            }
        }
    }
    return free_cell;
}


// arma el tablero N x N
void build_board(char board[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            board[i][j] = '-';
        }
    }
}

// arma las coordenadas de las celdas
void build_coords(struct coord cells[N * N]) {
    int counter = 0;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cells[counter].x = i;
            cells[counter].y = j;
            counter++;
        }
    }
}


int main(void)
{
    printf("TicTacToe [InCoMpLeTo :'(]\n");

    char board[N][N];
    build_board(board);

    struct coord cells[N * N];
    build_coords(cells);

    char turn = 'X';
    char winner = '-';
    int cell = 0;
    while (winner == '-' && has_free_cell(board)) {
        print_board(board);
        printf("\nTurno %c - Elija posición (número del 0 al %d): ", turn,
               CELL_MAX);
        int scanf_result = scanf("%d", &cell);
        if (scanf_result <= 0) {
            printf("Error al leer un número desde teclado\n");
            exit(EXIT_FAILURE);
        }
        if (cell >= 0 && cell <= CELL_MAX) {
            int row = cell / N;
            int colum = cell % N;
            if (board[row][colum] == '-') {
                board[row][colum] = turn;
                turn = turn == 'X' ? 'O' : 'X';
                winner = get_winner(board);
            } else {
                printf("\nCelda ocupada!\n");
            }
        } else {
            printf("\nCelda inválida!\n");
        }
    }
    print_board(board);
    if (winner == '-') {
        printf("Empate!\n");
    } else {
        printf("Ganó %c\n", winner);
    }
    return 0;
}
