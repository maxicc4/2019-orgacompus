CC=gcc
CFLAGS=-I.

ifeq ($(shell uname -p), mipsel)
	OBJ = main.c matrix_print.c matrix_destroy_mips.c matrix_create.S matrix_multiply.S mymalloc.S
else
	OBJ = main.c matrix_print.c matrix_destroy.c matrix_create.c matrix_multiply.c
endif

tp1: $(OBJ)
	$(CC) -o $@ $^