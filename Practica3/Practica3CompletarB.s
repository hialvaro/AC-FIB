.text
	.align 4
	.globl OperaMat
	.type	OperaMat, @function
OperaMat:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
# Aqui has de introducir el codigo
movl $0, -4(%ebp) #res
movl $0 ,-8(%ebp) #i
cmpl $3 , -8(%ebp) # i >= 3
jge fi
movl $0, -12 (%ebp) #j
cmpl $3 , -12(%ebp) #j >= 3
jge fi1
imul $4 , -12(%ebp), %eax #%eax = j*4 
imul $12 , -8(%ebp) ,%ecx #%ecx = i*12
add 8(%ebp) , %ecx #%ecx = @matriz + i*12
movl (%ecx,%eax) , %esi #@matriz + i*12 + j*4
movl (%esi), %ebx #%ebx = matriz i j valor
add  %ebx, -4(%ebp) #res = res +%ebx
add $1,-12(%ebp) #++j
fi1:
add $1,-8(%ebp) #++i
fi:

# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx	
	movl %ebp,%esp
	popl %ebp
	ret
