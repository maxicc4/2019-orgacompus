#include <mips/regdef.h>
#include <sys/syscall.h>


	.data
	.align 2
err_str:   .ascii   "Error: cannot allocate memory.\n"


	.text
	.align 2
	.globl 	create_matrix
	.ent   	create_matrix
	.abicalls
create_matrix:

	.frame	$fp, 40, ra	# creo el stack frame
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 40		# 4 (SRA) + 2 (LTA) + 4 (ABA)

	.cprestore 24		# inserta aqui "sw gp, 24(sp)", mas "lw gp, 24(sp)" luego de cada jal.
	
	sw	$fp, 28(sp)
	sw	ra, 32(sp)
	move	$fp, sp
	sw	a0, 40($fp)	#a0 guarda row
	sw	a1, 44($fp)	#a1 guarda cols

	li	a0, 12   	#guardo el tamaño de la estructura matrix_t

	la	t9, mymalloc	# llamo a malloc para crear la matriz
	jal	t9

	beq	v0, zero, error

	sw	v0, 16($fp)	# v0 guarda la direccion que devuelve malloc

	lw	t0, 40($fp)
	lw	t1, 44($fp)	# t0 y t1 guardan los valores que tenian a0 y a1 respectivamente.
	
	sw	t0, 0(v0)	# matrix->rows = rows
	sw	t1, 4(v0)	# matrix->cols = cols

	li	a0, 8		# guardo en a0 el tamaño de un double
	mul	a0, a0, t0	# lo multiplico por rows
	mul	a0, a0, t1	# lo multiplico por cols
	
	la	t9, mymalloc	# llamo a malloc para crear el array
	jal	t9

	beq	v0, zero, error
	
	lw	t0, 16($fp)	# en t0 se guarda la direccion a la matriz

	sw	v0, 8(t0)	# matrix->array = malloc(rows*cols*sizeof(double))

	move	v0, t0	# preparo v0 para devolverlo como resultado de la funcion

	b	end

error:
	li	v0, SYS_write
	la	a0, err_str	# preparo los registros para llamar a la syscall que imprime strings
	syscall			# fprintf(stderr, "Error: cannot allocate memory.\n");

	
	li	v0, SYS_exit		# preparo los registros para  llamar a la syscall que termine el programa
	syscall

end:

	move	sp, $fp		# destruccion del stackframe
	lw	gp, 24(sp)
	lw	$fp, 28(sp)
	lw	ra, 32(sp)
	addu	sp, sp, 40

	j	ra
	
	.end create_matrix
	
	
