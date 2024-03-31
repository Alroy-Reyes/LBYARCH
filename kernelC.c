#include <stdio.h>
#include <stdlib.h>

#define N 10 // Number of elements to display in vector Y

void stencil_c(int n, double* X, double* Y) {
	int i = 0;
	for (i = 3; i < n - 3; i++) {
		Y[i] = X[i - 3] + X[i - 2] + X[i - 1] + X[i] + X[i + 1] + X[i + 2] + X[i + 3];
	}
}


