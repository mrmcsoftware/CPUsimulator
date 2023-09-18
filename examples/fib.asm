/* Sample assembly language program for the CPU designed by
   Mark Craig (Fibonacci numbers) */

EQU i0 $1000
EQU i1 $1001
EQU i2 $1002
EQU c $1003

             DCSI 0 1 
             LOADI 0
             STOREI i0         # i0=0;
             LOADI 1
             STOREI i1         # i1=1;
             LOADI 18
: Loop       SUBI 1            # equiv: for (c=17;c>=0;c--)
             STOREI c
             LOAD i1
             ADD i0
             STOREI i2         # i2=i1+i0;

             JUMP Print        # print i2
: Continue

             LOAD i1
             STOREI i0         # i0=i1;
             LOAD i2
             STOREI i1         # i1=i2;
             LOAD c
             SKIPNEG
             JUMP Loop         # equiv: end for loop c
             HALT

: Print      LOAD i2
             LOADAI 10
             JUMPLTI Print1
             LOADAI 100
             JUMPLTI Print2
             LOADAI 1000
             JUMPLTI Print3
             LOADAI 10000
             JUMPLTI Print4
: Print5     DIVI 10000
             ADDI 48
             STOREI $800000
             LOAD i2
: Print4     MODI 10000
             DIVI 1000
             ADDI 48
             STOREI $800000
             LOAD i2
: Print3     MODI 1000
             DIVI 100
             ADDI 48
             STOREI $800000
             LOAD i2
: Print2     MODI 100
             DIVI 10
             ADDI 48
             STOREI $800000
             LOAD i2
: Print1     MODI 10
             ADDI 48
             STOREI $800000
: PrintSpace LOADI 32
             STOREI $800000
             JUMP Continue

/*
int i0=0,i1=1,i2,c;

printf("%d %d ",i0,i1);
for (c=0;c<12;c++)
	{
	i2=i0+i1;
	printf("%d ",i2);
	i0=i1; i1=i2;
	}
}
*/
