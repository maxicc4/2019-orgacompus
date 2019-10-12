#ifndef MATRIX_H_
#define MATRIX_H_

typedef struct matrix {
	size_t rows;
	size_t cols;
	double* array;
} matrix_t;


matrix_t *create_matrix(size_t rows, size_t cols);

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);

void destroy_matrix(matrix_t* m);

int print_matrix(FILE* fp, matrix_t* m);

#endif