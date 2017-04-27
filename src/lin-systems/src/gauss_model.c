#include <math.h>
#include <stdio.h>


int i, j, k, n ;
float a[20][20], b[20], x[20], m, s ;

int achaPivo (int k, int n) {
    int i, i_fP;
    float pivoValue;
    i_fP = k ;
    pivoValue = 0.0 ;
    for  (i = k ; i < n ; i++) {
        if (fabsf(a[i][k]) > pivoValue) {
            pivoValue = fabsf(a[i][k]) ;
            i_fP = i ;
        }
    }
    return i_fP ;
}


void trocaLinhas (int k, int i, int n) {
    int j ;
    float linhaTemp[20], valorTemp ;
    for (j = 0; j < n ; j++) linhaTemp[j] = a[i][j] ;
    for (j = 0; j < n ; j++) a[i][j] = a[k][j] ;
    for (j = 0; j < n ; j++) a[k][j] = linhaTemp[j] ;
    valorTemp = b[i] ;  b[i] = b[k] ;  b[k] = valorTemp ;
}


int main() {
    int pivo;
    printf ("\n Entre o numero de variaveis: \n") ;
    scanf ("%d", &n) ;
    printf ("\n Entre o vetor constante, separado por espa ̧cos: \n") ;
    for (i = 0 ; i < n ; i++){
        scanf ("%f", &b[i]) ;
    }
    printf ("\n Entre com a matriz de coeficientes, separada por espaços: \n") ;
    for (i = 0 ; i < n ; i++) {
        for (j = 0 ; j < n ; j++){
            scanf ("%f", &a[i][j]) ;
        }
    }


    for (k = 0 ; k < n-1 ; k++) {
        pivo = achaPivo (k, n) ;
        if (k != pivo){
            trocaLinhas (k, pivo, n) ;
        }
        for (i = k+1 ; i < n ; i++) {
            m = (a[i][k] / a[k][k]) ;
            a[i][k] = 0 ;
            for (j = k+1 ; j < n ; j++){
                a[i][j] = a[i][j] - m * a[k][j] ;
            }
            b[i] = b[i] - m * b[k] ;
        }
    }

    x[n-1] = b[n-1] / a[n-1][n-1] ;
    printf ("x[%d] = %f\n", n-1, x[n-1]) ;
    for (k = n-2 ; k > -1 ; k--) {
        s = 0 ;
        for (j = k+1 ; j < n ; j++) {
            s = s + a[k][j] * x[j] ;
        }
        x[k] = (b[k] - s) / a[k][k] ;
        printf ("x[%d] = %f \n", k, x[k]) ;
    }
}

