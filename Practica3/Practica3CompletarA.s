.text
	.align 4
	.globl OperaVec
	.type	OperaVec, @function
OperaVec:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
# Aqui has de introducir el codigo
movl $1 , %eax #I=1

for:
    cmpl 12(%ebp),%eax 
    JGE fi
    #imul $4 ,%eax , %ecx
    movl 8(%ebp), %edi
    movl (%edi,%eax,4), %edx #@Vectori
    cmpl  %edx , -4(%ebp)#vectori >= res
    jGE fi_if
    movl %edx, -4(%ebp)
fi_if:
    incl %eax
    JMP for
fi:
    movl %eax,-8(%ebp)


# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
