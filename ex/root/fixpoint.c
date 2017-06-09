#include <stdio.h>
#include <math.h>

#define N 100


float f1(float x){
    return 9.0 * x *x - exp(x);
}


float phi1(float x){
    return sqrt(exp(x)) / 3.0;
}


float f2(float x){
    return x*x*x - sqrt(3) * x + 2;
}


float phi2(float x){
    return cbrt(-2 + sqrt(3)*x);
}


int fixpoint(float x0, float eps_x, float eps_y,
             float *x,
             float (*f)(float),
             float (*phi)(float)){
    int k = 0;

    x[k] = x0;
    do {
        k++;
        x[k] = phi(x[k - 1]) ;

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

    n = fixpoint(x0, eps_x, eps_y, x, f2, phi2);

    if (argc > 1) {
        print(x, n, argv[1]);
    }
    print(x, n, "/dev/stdout");

    return 0;
}
