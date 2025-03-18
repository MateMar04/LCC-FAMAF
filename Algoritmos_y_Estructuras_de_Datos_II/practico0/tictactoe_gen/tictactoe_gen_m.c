#include <stdbool.h>
#include <stdio.h>

#define N 4


struct coord
{
    int x;
    int y;
};

bool has_free_cell(char board[N][N])
{
    bool has_free = false;
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            if (board[i][j] == '-')
            {
                has_free = true;
            }
        }
    }
    return has_free;
}

bool check_cell(char board[N][N], int x, int y)
{
    return board[x][y] == '-';
}

char get_winner(char board[N][N]) {
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


void print_board(char board[N][N])
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            printf("%c ", board[i][j]);
        }
        printf("\n");
    }
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




int main()
{

    char board[N][N];
    build_board(board);

    struct coord cells[N * N];
    build_coords(cells);

    int counter = 0;
    
    while (has_free_cell(board) && get_winner(board) == '-')
    {

        print_board(board);

        if (counter % 2 == 0)
        {
            int selection;
            printf("Jugador X: Ingrese la celda a marcar: ");
            scanf("%d", &selection);

            int x = cells[selection].x;
            int y = cells[selection].y;

            if (check_cell(board, x, y))
            {
                board[x][y] = 'X';
                counter++;
            }
            else
            {
                printf("Celda ocupada, intente nuevamente\n");
            }
        }
        else
        {
            printf("Jugador O: Ingrese la celda a marcar: ");
            int selection;
            scanf("%d", &selection);
            int x;
            int y;

            x = cells[selection].x;
            y = cells[selection].y;

            if (check_cell(board, x, y))
            {
                board[x][y] = 'O';
                counter++;
            }
            else
            {
                printf("Celda ocupada, intente nuevamente\n");
            }
        }
    }

    print_board(board);
    printf("El ganador es: %c\n", get_winner(board));

    return 0;
}