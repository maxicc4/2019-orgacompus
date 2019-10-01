	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Error: cannot read line %ld.\n\000"
	.align	2
$LC1:
	.ascii	"Error: cannot parse line %ld.\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$a0,72($fp)
	lw	$a1,76($fp)
	la	$t9,parse_cmdline
	jal	$ra,$t9
	la	$v0,__sF
	sw	$v0,24($fp)
	la	$v0,__sF+88
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
$L18:
	lw	$v0,24($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L20
	b	$L19
$L20:
	lw	$a0,24($fp)
	la	$t9,get_line
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L21
	la	$a0,__sF+176
	la	$a1,$LC0
	lw	$a2,44($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L21:
	lw	$v0,48($fp)
	lb	$v1,0($v0)
	lw	$v0,_ctype_
	addu	$v0,$v1,$v0
	addu	$v0,$v0,1
	lbu	$v0,0($v0)
	srl	$v0,$v0,3
	andi	$v0,$v0,0x1
	bne	$v0,$zero,$L22
	addu	$v0,$fp,32
	addu	$v1,$fp,36
	lw	$a0,48($fp)
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,parse_line
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L23
	la	$a0,__sF+176
	la	$a1,$LC1
	lw	$a2,44($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L23:
	lw	$a0,48($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$a0,32($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,36($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,28($fp)
	lw	$a1,40($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
$L22:
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	sw	$v0,44($fp)
	b	$L18
$L19:
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC2:
	.ascii	" \000"
	.align	2
$LC3:
	.ascii	"%lg\000"
	.text
	.align	2
	.globl	parse_line
	.ent	parse_line
parse_line:
	.frame	$fp,96,$ra		# vars= 56, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,96
	.cprestore 16
	sw	$ra,88($sp)
	sw	$fp,84($sp)
	sw	$gp,80($sp)
	move	$fp,$sp
	sw	$a0,96($fp)
	sw	$a1,100($fp)
	sw	$a2,104($fp)
	lw	$a0,96($fp)
	addu	$a1,$fp,24
	li	$a2,10			# 0xa
	la	$t9,strtoul
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v0,48($fp)
	blez	$v0,$L25
	lw	$v1,48($fp)
	lw	$v0,48($fp)
	mult	$v1,$v0
	mflo	$v0
	sw	$v0,52($fp)
	sw	$zero,56($fp)
	lw	$a0,48($fp)
	lw	$a1,48($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,100($fp)
	sw	$v1,0($v0)
	lw	$v0,100($fp)
	lw	$v0,0($v0)
	sw	$v0,40($fp)
	lw	$a0,48($fp)
	lw	$a1,48($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,104($fp)
	sw	$v1,0($v0)
	lw	$v0,104($fp)
	lw	$v0,0($v0)
	sw	$v0,44($fp)
	lw	$a0,24($fp)
	la	$a1,$LC2
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,60($fp)
	lw	$v0,60($fp)
	bne	$v0,$zero,$L26
	li	$v0,1			# 0x1
	sw	$v0,72($fp)
	b	$L24
$L26:
	addu	$v0,$fp,32
	lw	$a0,60($fp)
	la	$a1,$LC3
	move	$a2,$v0
	la	$t9,sscanf
	jal	$ra,$t9
	lw	$v0,100($fp)
	lw	$a0,0($v0)
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,32($fp)
	s.d	$f0,0($v0)
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	sw	$zero,64($fp)
$L27:
	lw	$v0,64($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L30
	b	$L28
$L30:
	lw	$v0,64($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$v0,$v0,16
	lw	$v0,0($v0)
	sw	$v0,68($fp)
$L31:
	lw	$v0,56($fp)
	lw	$v1,52($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L32
	move	$a0,$zero
	la	$a1,$LC2
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,60($fp)
	lw	$v0,60($fp)
	bne	$v0,$zero,$L33
	b	$L32
$L33:
	addu	$v0,$fp,32
	lw	$a0,60($fp)
	la	$a1,$LC3
	move	$a2,$v0
	la	$t9,sscanf
	jal	$ra,$t9
	lw	$a0,68($fp)
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,32($fp)
	s.d	$f0,0($v0)
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	b	$L31
$L32:
	lw	$v1,56($fp)
	lw	$v0,52($fp)
	beq	$v1,$v0,$L35
	li	$v0,1			# 0x1
	sw	$v0,72($fp)
	b	$L24
$L35:
	sw	$zero,56($fp)
	lw	$v0,64($fp)
	addu	$v0,$v0,1
	sw	$v0,64($fp)
	b	$L27
$L28:
	sw	$zero,72($fp)
	b	$L24
$L25:
	li	$v0,1			# 0x1
	sw	$v0,72($fp)
$L24:
	lw	$v0,72($fp)
	move	$sp,$fp
	lw	$ra,88($sp)
	lw	$fp,84($sp)
	addu	$sp,$sp,96
	j	$ra
	.end	parse_line
	.size	parse_line, .-parse_line
	.align	2
	.globl	get_line
	.ent	get_line
get_line:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
$L37:
	lw	$v0,24($fp)
	addu	$v0,$v0,1024
	sw	$v0,24($fp)
	lw	$a0,36($fp)
	lw	$a1,24($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v0,36($fp)
	bne	$v0,$zero,$L40
	sw	$zero,40($fp)
	b	$L36
$L40:
	lw	$v1,36($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	move	$a0,$v0
	li	$a1,1024			# 0x400
	lw	$a2,64($fp)
	la	$t9,fgets
	jal	$ra,$t9
	bne	$v0,$zero,$L41
	lw	$v0,64($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L42
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$v0,$LC2
	sw	$v0,40($fp)
	b	$L36
$L42:
	sw	$zero,40($fp)
	b	$L36
$L41:
	lw	$a0,36($fp)
	la	$t9,strlen
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	addu	$v0,$v0,-1
	sw	$v0,32($fp)
	lw	$v0,64($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	bne	$v0,$zero,$L38
	lw	$v1,36($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lb	$v1,0($v0)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L37
$L38:
	lw	$v0,36($fp)
	sw	$v0,40($fp)
$L36:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	get_line
	.size	get_line, .-get_line
	.rdata
	.align	2
$LC4:
	.ascii	"help\000"
	.align	2
$LC5:
	.ascii	"version\000"
	.data
	.align	2
$LC6:
	.word	$LC4
	.word	0
	.word	0
	.word	104
	.word	$LC5
	.word	0
	.word	0
	.word	86
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	memcpy
	.rdata
	.align	2
$LC7:
	.ascii	"hV\000"
	.text
	.align	2
	.ent	parse_cmdline
parse_cmdline:
	.frame	$fp,112,$ra		# vars= 64, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,112
	.cprestore 24
	sw	$ra,104($sp)
	sw	$fp,100($sp)
	sw	$gp,96($sp)
	move	$fp,$sp
	sw	$a0,112($fp)
	sw	$a1,116($fp)
	sw	$zero,36($fp)
	addu	$v0,$fp,40
	la	$v1,$LC6
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,48			# 0x30
	la	$t9,memcpy
	jal	$ra,$t9
$L47:
	addu	$v1,$fp,40
	addu	$v0,$fp,36
	sw	$v0,16($sp)
	lw	$a0,112($fp)
	lw	$a1,116($fp)
	la	$a2,$LC7
	move	$a3,$v1
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L49
	b	$L46
$L49:
	lw	$v0,32($fp)
	sw	$v0,88($fp)
	li	$v0,86			# 0x56
	lw	$v1,88($fp)
	beq	$v1,$v0,$L52
	li	$v0,104			# 0x68
	lw	$v1,88($fp)
	beq	$v1,$v0,$L51
	b	$L53
$L51:
	lw	$v0,116($fp)
	lw	$a0,0($v0)
	move	$a1,$zero
	la	$t9,do_usage
	jal	$ra,$t9
	b	$L47
$L52:
	lw	$v0,116($fp)
	lw	$a0,0($v0)
	la	$t9,do_version
	jal	$ra,$t9
	b	$L47
$L53:
	lw	$v0,116($fp)
	lw	$a0,0($v0)
	li	$a1,1			# 0x1
	la	$t9,do_usage
	jal	$ra,$t9
	b	$L47
$L46:
	move	$sp,$fp
	lw	$ra,104($sp)
	lw	$fp,100($sp)
	addu	$sp,$sp,112
	j	$ra
	.end	parse_cmdline
	.size	parse_cmdline, .-parse_cmdline
	.rdata
	.align	2
$LC8:
	.ascii	"Usage:\n\000"
	.align	2
$LC9:
	.ascii	"  %s -h\n\000"
	.align	2
$LC10:
	.ascii	"  %s -V\n\000"
	.align	2
$LC11:
	.ascii	"  %s < in_file > out_file\n\000"
	.align	2
$LC12:
	.ascii	"Options:\n\000"
	.align	2
$LC13:
	.ascii	"  -V, --version  Print version and quit.\n\000"
	.align	2
$LC14:
	.ascii	"  -h, --help      Print this information and quit.\n\000"
	.align	2
$LC15:
	.ascii	"Examples:\n\000"
	.align	2
$LC16:
	.ascii	"  %s < in.txt > out.txt\n\000"
	.align	2
$LC17:
	.ascii	"  cat in.txt | %s > out.txt\n\000"
	.text
	.align	2
	.ent	do_usage
do_usage:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	sw	$a1,44($fp)
	la	$a0,__sF+176
	la	$a1,$LC8
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC9
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC10
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC11
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC15
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC16
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC17
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,exit
	jal	$ra,$t9
	.end	do_usage
	.size	do_usage, .-do_usage
	.rdata
	.align	2
$LC18:
	.ascii	"%s\n\000"
	.align	2
$LC19:
	.ascii	"0.0.1\000"
	.text
	.align	2
	.ent	do_version
do_version:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	la	$a0,__sF+176
	la	$a1,$LC18
	la	$a2,$LC19
	la	$t9,fprintf
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
	.end	do_version
	.size	do_version, .-do_version
	.rdata
	.align	2
$LC20:
	.ascii	"Error: cannot allocate memory.\n\000"
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L58
	la	$a0,__sF+176
	la	$a1,$LC20
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L58:
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	lw	$v0,52($fp)
	sw	$v0,4($v1)
	lw	$s0,24($fp)
	lw	$v1,48($fp)
	lw	$v0,52($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,8($s0)
	lw	$v0,24($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L59
	la	$a0,__sF+176
	la	$a1,$LC20
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L59:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	beq	$v0,$zero,$L60
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
$L60:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC21:
	.ascii	"%ld \000"
	.align	2
$LC22:
	.ascii	"%lg \000"
	.align	2
$LC23:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC21
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$a0,0($v0)
	lw	$v0,0($v1)
	mult	$a0,$v0
	mflo	$v0
	sw	$v0,24($fp)
	sw	$zero,28($fp)
$L63:
	lw	$v0,28($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L66
	b	$L64
$L66:
	lw	$a0,52($fp)
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,48($fp)
	la	$a1,$LC22
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L63
$L64:
	lw	$a0,48($fp)
	la	$a1,$LC23
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
matrix_multiply:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,56($fp)
	lw	$v1,60($fp)
	lw	$a0,0($v0)
	lw	$a1,4($v1)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,24($fp)
	sw	$zero,28($fp)
$L68:
	lw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$v0,0($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L71
	b	$L69
$L71:
	sw	$zero,32($fp)
$L72:
	lw	$v0,24($fp)
	lw	$v1,32($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L75
	b	$L70
$L75:
	lw	$a0,24($fp)
	lw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	sw	$zero,0($v0)
	sw	$zero,4($v0)
	sw	$zero,36($fp)
$L76:
	lw	$v0,56($fp)
	lw	$v1,36($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L79
	b	$L74
$L79:
	lw	$a0,24($fp)
	lw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a2,$v1,$v0
	lw	$a0,24($fp)
	lw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a3,$v1,$v0
	lw	$a0,56($fp)
	lw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a1,$v1,$v0
	lw	$a0,60($fp)
	lw	$v0,24($fp)
	lw	$v1,36($fp)
	lw	$v0,4($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,0($a3)
	add.d	$f0,$f0,$f2
	s.d	$f0,0($a2)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L76
$L74:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L72
$L70:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L68
$L69:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	matrix_multiply
	.size	matrix_multiply, .-matrix_multiply
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
