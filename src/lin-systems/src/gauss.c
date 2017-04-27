#include <math.h>
#include <stdio.h>


#ifndef MAX_SIZE
#define MAX_SIZE 20
#endif


void read_const_vector(int n, float b[MAX_SIZE]){
    int i;
    puts("Entre o vetor constante:\n") ;
    for (i = 0 ; i < n ; i++){
        scanf ("%f", &b[i]) ;
    }
}


void read_matrix(int size, float matrix[MAX_SIZE][MAX_SIZE]){
    int lin, col;

    puts("Entre com a matriz de coeficientes:\n");
    for (lin = 0 ; lin < size ; lin++) {
        for (col = 0 ; col < size ; col++){
            scanf("%f", *(matrix + lin) + col) ;
        }
    }
}


int get_pivot(int k, int n, float matrix[MAX_SIZE][MAX_SIZE]) {
    int i, pivot = k;
    float pivot_val;
    for  (i = k, pivot = k, pivot_val = 0.0; i < n; i++) {
        if (fabsf(matrix[i][k]) > pivot_val) {
            pivot_val = fabsf(matrix[i][k]) ;
            pivot = i ;
        }
    }
    return pivot;
}


void copy_line(int size, float from[MAX_SIZE], float to[MAX_SIZE]){
    int col;
    for (col = 0; col < size ; col++){
        to[col] = from[col] ;
    }
}


void swap_lines(int l1, int l2, int size,
                float matrix[MAX_SIZE][MAX_SIZE], float b[MAX_SIZE]) {
    float tmp_line[MAX_SIZE], tmp ;
    copy_line(size, matrix[l1], tmp_line);
    copy_line(size, matrix[l2], matrix[l1]);
    copy_line(size, tmp_line, matrix[l2]);

    tmp = b[l1];
    b[l1] = b[l2];
    b[l2] = tmp;
}


void gauss_reduce(int size, float matrix[MAX_SIZE][MAX_SIZE], float b[MAX_SIZE]){
    int pivot, lin, col, step;
    float multiplier;

    for (step = 0 ; step < size - 1 ; step++) {
        pivot = get_pivot(step, size, matrix) ;
        if (step != pivot){
            swap_lines(step, pivot, size, matrix, b) ;
        }
        for (lin = step + 1 ; lin < size ; lin++) {
            multiplier = (matrix[lin][step] / matrix[step][step]) ;
            matrix[lin][step] = 0 ;
            for (col = step+1 ; col < size ; col++){
                matrix[lin][col] -= multiplier * matrix[step][col] ;
            }
            b[lin] -= multiplier * b[step] ;
        }
    }
}


void gauss_solve(int size,
                 float matrix[MAX_SIZE][MAX_SIZE],
                 float b[MAX_SIZE], float x[MAX_SIZE]){
    int j, k;
    float s;
    x[size-1] = b[size-1] / matrix[size-1][size-1] ;
    for (k = size - 2 ; k > -1 ; k--) {
        s = 0 ;
        for (j = k + 1 ; j < size ; j++) {
            s += matrix[k][j] * x[j] ;
        }
        x[k] = (b[k] - s) / matrix[k][k] ;
    }
}


void print_x(int size, float x[MAX_SIZE]){
    int i;
    for (i = 0; i < size; i++){
        printf("x[%d] = %f \n", i, x[i]) ;
    }
}


int main() {
    int size ;
    float matrix[MAX_SIZE][MAX_SIZE], b[MAX_SIZE], x[MAX_SIZE] ;

    puts("Entre o numero de variaveis: \n") ;
    scanf ("%d", &size) ;
    if (size > MAX_SIZE) {
        fputs("Size too large!\n", stderr);
        return 1;
    }
    read_const_vector(size, b);
    read_matrix(size, matrix);

    gauss_reduce(size, matrix, b);
    gauss_solve(size, matrix, b, x);
    print_x(size, x);

    return 0;
}

