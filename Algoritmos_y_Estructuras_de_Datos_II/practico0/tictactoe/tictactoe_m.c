#include <stdbool.h>
#include <stdio.h>

bool has_free_cell(char board[3][3])
{
    bool has_free = false;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if (board[i][j] == '-')
            {
                has_free = true;
            }
        }
    }
    return has_free;
}

bool check_cell(char board[3][3], int x, int y)
{
    return board[x][y] == '-';
}

char get_winner(char board[3][3])
{
    for (int i = 0; i < 3; i++)
    {
        // Revisa fila i
        if (board[i][0] != '-' && board[i][0] == board[i][1] && board[i][1] == board[i][2])
        {
            return board[i][0];
        }
        // Revisa columna i
        if (board[0][i] != '-' && board[0][i] == board[1][i] && board[1][i] == board[2][i])
        {
            return board[0][i];
        }
    }
    // Revisa la diagonal principal
    if (board[0][0] != '-' && board[0][0] == board[1][1] && board[1][1] == board[2][2])
    {
        return board[0][0];
    }
    // Revisa la diagonal secundaria
    if (board[0][2] != '-' && board[0][2] == board[1][1] && board[1][1] == board[2][0])
    {
        return board[0][2];
    }

    return '-';
}

void print_board(char board[3][3])
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            printf("%c ", board[i][j]);
        }
        printf("\n");
    }
}

struct coord
{
    int x;
    int y;
};

int main()
{

    char board[3][3] = {{'-', '-', '-'}, {'-', '-', '-'}, {'-', '-', '-'}};
    int counter = 0;
    struct coord cells[9] = {
        {0, 0}, {0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2}, {2, 0}, {2, 1}, {2, 2}};
    ;

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
}