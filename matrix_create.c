#include <stdio.h>
#include <stdlib.h>
#include "matrix.h"


matrix_t* create_matrix(size_t rows, size_t cols)
{
	matrix_t *matrix = malloc(sizeof(matrix_t));
	if (matrix == NULL) {
		fprintf(stderr, "Error: cannot allocate memory.\n");
		exit(1);
	}
	matrix->rows = rows;
	matrix->cols = cols;
	matrix->array = malloc(rows*cols*sizeof(double));
	if (matrix->array == NULL) {
		fprintf(stderr, "Error: cannot allocate memory.\n");
		exit(1);
	}

	return matrix;
}
