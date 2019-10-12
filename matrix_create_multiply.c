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

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2)
{
	matrix_t *m_result = create_matrix(m1->rows, m2->cols);
	for (int i=0; i < m_result->rows; i++) {
		for (int j=0; j < m_result->cols; j++) {
			m_result->array[(i*m_result->cols) + j] = 0;
			for (int k=0; k < m1->cols; k++) {
				m_result->array[(i*m_result->cols) + j] += m1->array[(i*m_result->cols) + k] * m2->array[(k*m_result->cols) + j];
			}
		}
	}
	return m_result;
}
