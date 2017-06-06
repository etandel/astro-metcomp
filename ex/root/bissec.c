#include <stdio.h>
#include <math.h>


double f(double x) {
    return 1 - exp(x) / 20.0 + sin(x / 2.0);
}


double bissec(double a, double b, double eps) {
    double x;
    while (abs(b - a) > eps) {
        x = (a + b) / 2.0;
        if (f(a) * f(x) > 0.0) {
            a = x;
        }
        else {
            b = x;
        }
    }
    return (a + b) / 2.0;
}


int main(void) {
    double x = bissec(3.6, 3.7, 0.0000001);
    printf("%f\t%f", x, f(x)); 
    return 0;
}
