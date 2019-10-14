#include <mips/regdef.h>
#include <sys/syscall.h>


	.text
	.align 2
	.globl matrix_multiply
	.ent matrix_multiply
	.abicalls

matrix_multiply:

	.frame	$fp, 48, ra	# creo el stack frame
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 48		# 6 (SRA) + 2 (LTA) + 4 (ABA)


	sw	s0, 24(sp)
	sw	s1, 28(sp)

	.cprestore 32
	
	sw	$fp, 36(sp)
	sw	ra, 40(sp)
	
	move	$fp, sp
	
	sw	a0, 48($fp)	# a0 guarda m1
	sw	a1, 52($fp)	# a1 guarda m2
	
	lw	s0, 0(a0)	# s0 = m1->rows = m_result->rows
	move a0, s0
	
	lw	s1, 4(a1)	# s1 = m2->cols = m_result->cols
	move a1, s1

	la	t9, create_matrix # llamo a la funcion create_matrix
	jal	t9

	sw	v0, 16($fp)	# v0 = m_result
	
	
	lw	t5, 8(v0)	# t5 = m_result->array
	lw	t0, 48($fp)	# t0 = m1
	lw	t6, 4(t0)	# t6 = m1->cols
	lw	t7, 8(t0)	# t7 = m1->array
	lw	t0, 52($fp)	# t0 = m2
	lw	t9, 8(t0)	# t9 = m2->array
	
	li	t0, 0		# i = 0

for1:
	bgeu	t0, s0, end_for1
	li	t1, 0		# j = 0
for2:
	bgeu	t1, s1, end_for2
	
	mul	t2, t0, s1	# t2 = (i*m_result->cols)
	addu	t2, t2, t1	# t2 = t2 + j
	
	sll	t2, t2, 3	# t2 = t2 * 8
	addu	t3, t2, t5	# t3 = pos de m_result->array[(i*m_result->cols) + j]

	li.d	$f4, 0    	# carga el valor 0 en { $f4 , $f5 }
	s.d	$f4, 0(t3)	# m_result->array[(i*m_result->cols) + j] = 0

	ori	t8, t3, 0	# guardo el valor de t3 en t8 para usarlo luego.

	li	t4, 0		# k = 0
for3:
	bgeu	t4, t6, end_for3

	mul	t2, t0, s1	# t2 = (i*m_result->cols)
	addu	t2, t2, t4	# t2 = t2 + k

	sll	t2, t2, 3	# t2 = t2 * 8
	addu	t3, t2, t7	# t3 = pos de m1->array[(i*m_result->cols) + k]

	l.d 	$f0, 0(t3)	# { $f0 , $f1 } = m1->array[(i*m_result->cols) + k]

	mul	t2, t4, s1	# t2 = (k*m_result->cols)
	addu	t2, t2, t1	# t2 = t2 + j

	sll	t2, t2, 3	# t2 = t2 * 8
	addu	t3, t2, t9	# t3 = pos de m2->array[(k*m_result->cols) + j]

	l.d	$f2, 0(t3)	# { $f2 , $f3 } = m2->array[(k*m_result->cols) + j]

	mul.d	$f2, $f0, $f2	# { $f2 , $f3 } = m1->array[(i*m_result->cols) + k] * m2->array[(k*m_result->cols) + j]

	add.d	$f4, $f4, $f2	# { $f4 , $f5 } += m1->array[(i*m_result->cols) + k] * m2->array[(k*m_result->cols) + j]
	
	addiu	t4, t4, 1

	s.d	$f4, 0(t8)	# m_result->array[(i*m_result->cols) + j] = { $f4 , $f5 }

	b	for3

end_for3:

	addiu	t1, t1, 1

	b	for2

end_for2:

	addiu	t0, t0, 1

	b	for1
end_for1:

	move	sp, $fp		# destruccion del stackframe
	lw	s0, 24(sp)
	lw	s1, 28(sp)
	lw	gp, 32(sp)
	lw	$fp, 36(sp)
	lw	ra, 40(sp)
	addu	sp, sp, 48

	j	ra
	.end	matrix_multiply
