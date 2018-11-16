 .text
	.align 4
	.globl Intercambiar
	.type Intercambiar,@function
Intercambiar:
      
pushl %ebp
movl %esp ,%ebp 
pushl %esi ;
pushl %ebx ;

movl 8(%ebp) , %eax ; #v
imul $12, 12(%ebp) , %ecx ; #i
imul $12, 16(%ebp) , %edx ; #j






movb (%eax,%ecx), %bl ;   #s = v[i].c;
movb (%eax,%edx) , %bh ; 
movb %bl , (%eax,%edx) ; # v[j].c = s;
movb %bh ,(%eax,%ecx) ; 



movl 4(%eax,%ecx), %esi ;  #  tmp    = v[i].k;
movl 4(%eax,%edx) , %ebx ; 
movl %ebx , 4(%eax,%ecx) ; # v[j].c = s;
movl %esi ,4(%eax,%edx) ; 




movl 8(%eax,%ecx), %esi ;  #  tmp    = v[i].k;
movl 8(%eax,%edx) , %ebx ; 
movl %ebx , 8(%eax,%ecx) ; # v[j].c = s;
movl %esi ,8(%eax,%edx) ; 
 
 popl %ebx ;
 popl %esi ;
 movl %ebp ,%esp 
 popl %ebp ;
 ret ;
 



/*
#include "elemento.h"

void Intercambiar(S1 v[], int i, int j) {

  int tmp; 
  int *aux;
  char s;

  s      = v[i].c;
  v[i].c = v[j].c;
  v[j].c = s;

  tmp    = v[i].k;
  v[i].k = v[j].k;
  v[j].k = tmp;

  aux    = v[i].m;
  v[i].m = v[j].m;
  v[j].m = aux;

}

*/
