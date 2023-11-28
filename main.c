#include <stdio.h>

/*
Определить количество положительных
и отрицательных элементов массива.
(N = 5, M = 6)
*/

#define N 5
#define M 6

void process(int n, int m, int matrix [M][N], int *result)
{
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) 
        {
            if (matrix[i][j] > 0)
            	result[0] += 1;
            else
            	result[1] += 1;
        }
    }

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result[2] = {0, 0};
    
    for (int i = 0; i < M; ++i) 
    {
        for (int j = 0; j < N; ++j) 
        {
            scanf("%d", &matrix[i][j]);
        }   
    }

    process(N, M, matrix, result);
    puts("*****************");
    puts("Результат работы");
	puts("*****************");
    printf("Кол-во отрицательных: %d\nКол-во положительных: %d\n", result[1], result[0]);

    return 0;
}