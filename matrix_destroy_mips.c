#include <stdio.h>
#include <stdlib.h>
#include "matrix.h"
#include "mymalloc.h"


void destroy_matrix(matrix_t* m)
{
	if (m != NULL) {
		// Como en mips create_matrix reserva memoria con mymalloc,
		// es necesario liberarla con myfree
		myfree(m->array);
		myfree(m);
	}
}
