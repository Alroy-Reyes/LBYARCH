#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <time.h>
//extern void asmhello();

//int main() {
//	asmhello();
//	return 0;
//}


//extern long long int sum(long long int a1, long long int a2, long long int* a3);

//int main()
//{
//	long long int a1, a2, a3, ans;
//	a1 = 512;
//	a2 = 1024;
//	a3 = 5;
//	ans = sum(a1, a2, &a3);
//	printf("%lld + %lld = %lld \n", a1, a2, ans);
//	printf("new A3 value is %lld", a3);
//	return 0;
//}

#define N 10

//Implement the C version
void stencil_c(int n, double* X, double* Y) {
	for (int i = 3; i < n - 3; i++) {
		Y[i] = X[i - 3] + X[i - 2] + X[i - 1] + X[i] + X[i + 1] + X[i + 2] + X[i + 3];
	}
}


// Implement the assembly version
extern void stencil_asm(int n, double* X, double* Y);


double get_execution_time(clock_t start, clock_t end) {
	return ((double)(end - start)) / CLOCKS_PER_SEC;
}

int main() {
	int i;
	clock_t start_c, end_c;
	double cpu_time_used_c;

	// Length of vectors
	int lengths[] = { 1 << 20, 1 << 24, 1 << 27 }; // {2^20, 2^24, 2^30}
	int num_lengths = sizeof(lengths) / sizeof(lengths[0]);

	srand(time(NULL)); // Seed the random number generator

	for (int j = 0; j < num_lengths; j++) {
		int n = lengths[j];
		//printf("%d", n);
		double* X = (double*)malloc(n * sizeof(double));
		double* Y = (double*)malloc(n * sizeof(double));

		// Initialize vector X with random values
		for (i = 0; i < n; i++) {
			X[i] = (double)(rand() % 100); // Random value between 0 and 99
		}

		// Initialize vector Y with 0.0
		for (i = 0; i < n; i++) {
			Y[i] = 0.0;
		}

		printf("\nFirst ten values of X:");
		for (i = 0; i < N; i++) {
			printf("%.2lf ", X[i]);
		}
		// Start timing for C implementation
		start_c = clock();

		// Call stencil function
		stencil_c(n, X, Y);

		// End timing for C implementation
		end_c = clock();

		cpu_time_used_c = ((double)(end_c - start_c)) / CLOCKS_PER_SEC;
		printf("\n\nTime taken by C implementation for vector length %d: %lf seconds\n", n, cpu_time_used_c);

		// Print the first ten values of vector Y
		printf("\nFirst ten values of vector Y:\n");
		for (i = 3; i < N+3 && i < n; i++) {
			printf("%.2lf ", Y[i]);
		}
		printf("\n\n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n");

		// Reset vector Y to 0.0
		for (i = 0; i < n; i++) {
			Y[i] = 0.0;
		}

		// Start timing for assembly implementation
		start_c = clock();

		// Call stencil function (assembly version)
		stencil_asm(n, X, Y);

		// End timing for assembly implementation
		end_c = clock();

		cpu_time_used_c = ((double)(end_c - start_c)) / CLOCKS_PER_SEC;
		printf("\nTime taken by assembly implementation for vector length %d: %lf seconds\n", n, cpu_time_used_c);

		// Print the first ten values of vector Y (assembly implementation)
		printf("\nFirst ten values of vector Y (assembly implementation):\n");
		for (i = 3; i < N + 3 && i < n; i++) {
			printf("%.2lf ", Y[i]);
		}
		printf("\n\n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n");

		// Free allocated memory
		free(X);
		free(Y);
	}

	return 0;
}