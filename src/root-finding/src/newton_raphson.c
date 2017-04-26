#include <stdio.h>
#include <math.h>

#define N 100


float f1(float x){
    return 9.0 * x *x - exp(x);
}


float f2(float x){
    return x*x*x - sqrt(3) * x + 2;
}

float f2_prime(float x){
    return 3.0*x*x - sqrt(3);
}


float f3(float x){
    return x*x*x - exp(x / 3.0) + 10;
}


float f3_diff(float x){
    return 3*x*x - exp(x / 3.0) / 3.0;
}

/***************************************************/

float phi(float (*f)(float), float (*diff)(float), float x){
    return x - (f(x) / diff(x));
}


int fixpoint(float x0, float eps_x, float eps_y,
             float *x,
             float (*f)(float),
             float (*diff)(float)){
    int k = 0;

    x[k] = x0;
    do {
        k++;
        x[k] = phi(f, diff, x[k - 1]) ;

    } while ((fabsf(x[k] - x[k-1]) >= eps_x) && (fabsf(f(x[k])) >= eps_y)) ;

    return k;
}


void print(float *x, int n, const char fname[]){
    FILE * outf = fopen(fname, "w");
    int i;

    fprintf(outf, "i\t\tx\n");

    for (i=0; i < n; i++){
        fprintf(outf, "%d\t%13.8f\n", i, x[i]);
    }

    fclose(outf);

}


int main(const int argc, const char * argv[]){
    float x[N];
    float x0, eps_x, eps_y;
    int n;

    puts("Digite x0 eps_x eps_y\n");
    scanf("%f %f %f", &x0, &eps_x, &eps_y);

    n = fixpoint(x0, eps_x, eps_y, x, f3, f3_diff);

    if (argc > 1) {
        print(x, n, argv[1]);
    }
    print(x, n, "/dev/stdout");

    return 0;
}
