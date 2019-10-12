#include <stdio.h>
#include <stdlib.h>
#include "matrix.h"


void destroy_matrix(matrix_t* m)
{
	if (m != NULL) {
		free(m->array);
		free(m);
	}
}

// Suponemos que la matriz a imprimir siempre es cuadrada
int print_matrix(FILE* fp, matrix_t* m)
{
	fprintf(fp, "%ld ", m->rows);
	int total_values = m->rows * m->rows;
	for (int i=0; i < total_values; i++) {
		fprintf(fp, "%lg ", m->array[i]);
	}
	fprintf(fp, "\n");
}
