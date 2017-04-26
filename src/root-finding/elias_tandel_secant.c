/* Autor: Elias Tandel Barrionovo
 *
 * Uso: ./secant [OUTPUT_FILE]
 *
 * Para trocar a função, basta redefinir a variável global f.
 * O número máximo de iterações no passo da secante pode ser
 * definido em tempo de compilação com a macro MAX_ITERATIONS (default 100):
 *
 * gcc elias_tandel_secant.c -o secant -lm -DMAX_ITERATIONS=10000
 *
 */
#include <math.h>
#include <stdio.h>


#ifndef MAX_ITERATIONS
#define MAX_ITERATIONS 100
#endif


/* Funções */

float f1(float x){
    return 9.0 * x*x - exp(x);
}


float f2(float x){
    return x*x*x - sqrt(3) * x + 2;
}


float f3(float x){
    return x*x*x - exp(x / 3.0) + 10;
}


/* Secante + Bisseção */

float (*f)(float) = f3;


float secant_step(float x_curr, float x_before){
    float fx_curr = f(x_curr), fx_before = f(x_before);
    return (x_before * fx_curr - x_curr * fx_before) / (fx_curr - fx_before);
}


int secant(float a, float b, float eps_x, float eps_y, float x[]){
    int k = 1;

    x[0] = a;
    x[1] = b;
    while(fabsf(x[k] - x[k-1]) >= eps_x && fabsf(f(x[k])) >= eps_y &&
          k < MAX_ITERATIONS - 1){
        k++;
        x[k] = secant_step(x[k-1], x[k-2]);

    }

    return k;
}

void bissec(float n_bissec_iter, float *a, float *b){
    float xm;

    for (; n_bissec_iter > 0; n_bissec_iter--){
        xm = (*a + *b) / 2.0;
        if (f(*a) * f(xm) > 0){
            *a = xm;
        }
        else {
            *b = xm;
        }
    }
}


/* Main */


void print_convergence(float x[], int n, const char fname[]){
    FILE * outf = fopen(fname, "w");
    int i;

    fprintf(outf, "i\t\tx\n");
    for (i=0; i < n; i++){
        fprintf(outf, "%d\t%13.8f\n", i, x[i]);
    }

    fclose(outf);

}


int main(const int argc, const char * argv[]){
    float x[MAX_ITERATIONS], a, b, eps_x, eps_y;
    int n_bissec_iter, n_sec_iter;

    puts("Digite n_bissec_iter a b eps_x eps_y\n");
    scanf("%d %f %f %f %f", &n_bissec_iter, &a, &b, &eps_x, &eps_y);

    bissec(n_bissec_iter, &a, &b);
    n_sec_iter = secant(a, b, eps_x, eps_y, x);

    print_convergence(x, n_sec_iter, argc > 1 ? argv[1] : "/dev/stdout");

    return 0;
}
