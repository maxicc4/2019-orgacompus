#include <stdio.h>
#include <stdlib.h>
#include "matrix.h"


// Suponemos que la matriz a imprimir siempre es cuadrada
int print_matrix(FILE* fp, matrix_t* m)
{
	fprintf(fp, "%ld ", m->rows);
	int total_values = m->rows * m->rows;
	int i;
	for (i=0; i < total_values; i++) {
		fprintf(fp, "%lg ", m->array[i]);
	}
	fprintf(fp, "\n");
}
