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
