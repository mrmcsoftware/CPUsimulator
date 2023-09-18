/* Sample assembly language program for the CPU designed by
   Mark Craig (factorial using recursion with user stack) */

EQU n $1000
EQU t $1001
EQU t2 $1002
EQU m $1003
EQU buf $1050

             NOOP
: DoIt       DCSI Enter n (or 999 to quit): 
             CALL getval
             POP
             LOADAI 999
             JUMPEQI Done
             STOREI n           # n=entered value
             PUSH               # pass n to function
             CALL Printval      # print n value on stack
             CALL multnums      # call function
             DCSI ! = 
             CALL Printval      # print result
             DCSNI 
             DCSNI 
             JUMP DoIt
: Done       HALT

: multnums   SREAD 1            # get passed parameter n, but don't remove
             LOADAI 1           # if n>=1 then recurse
             JUMPGTEI Notdone
             POP                # done, so no longer need passed parameter n
             LOADI 1            # return 1
             PUSH
             RETURN
: Notdone    SUBI 1             # pass n-1 to function
             PUSH
             CALL multnums      # call function
             POP                # retrieve returned value
             STOREI t
             POP                # retrieve passed in value
             MUL t              # multiply the two
             PUSH               # return result
             RETURN

: getval     LOADI 0
             STOREI n           # 0 digits
: mLoop0     LOADAI 256         # wait ...
  : mLoop    DATAIN             #  for ...
             JUMPLTI mLoop      #   keypress
             SUBI 256           # remove keypress flag to get key ASCII value
             STOREI $800003     # Consume keypress
             STOREI $800000     # send key pressed to TTY
             LOADAI 10
             JUMPEQI entdone    # done entering number
             LOADAI 13          # alternate ENTER
             JUMPEQI entdone    # done entering number
             SUBI 48            # find numerical value (t)
             STOREI t
             LOADI buf
             ADD n
             LOADA t
             STOREAIND          # buf[n]=t
             LOAD n
             ADDI 1
             STOREI n
             JUMP mLoop0
: entdone    LOADI 0
             STOREI t
             LOADI 1
             STOREI m
             LOAD n
             SUBI 1
  : mLoop1   STOREI n
             ADDI buf
             LOADAIND
             STOREAI t2
             LOAD t2
             MUL m
             ADD t
             STOREI t
             LOAD m
             MULI 10
             STOREI m
             LOAD n
             SUBI 1
             LOADAI 0
             JUMPGTEI mLoop1
             LOAD t
             PUSH               # return entered value
             RETURN

: Printval   SREAD 1
             LOADAI 10
             JUMPLTI Print1
             LOADAI 100
             JUMPLTI Print2
             LOADAI 1000
             JUMPLTI Print3
             LOADAI 10000
             JUMPLTI Print4
             LOADAI 100000
             JUMPLTI Print5
             LOADAI 1000000
             JUMPLTI Print6
             LOADAI 10000000
             JUMPLTI Print7
             LOADA hundmil
             JUMPLTI Print8
             LOADA onegig
             JUMPLTI Print9
: Print10    DIV onegig
             ADDI 48
             STOREI $800000
             SREAD 1
: Print9     MOD onegig
             DIV hundmil
             ADDI 48
             STOREI $800000
             SREAD 1
: Print8     MOD hundmil
             DIVI 10000000
             ADDI 48
             STOREI $800000
             SREAD 1
: Print7     MODI 10000000
             DIVI 1000000
             ADDI 48
             STOREI $800000
             SREAD 1
: Print6     MODI 1000000
             DIVI 100000
             ADDI 48
             STOREI $800000
             SREAD 1
: Print5     MODI 100000
             DIVI 10000
             ADDI 48
             STOREI $800000
             SREAD 1
: Print4     MODI 10000
             DIVI 1000
             ADDI 48
             STOREI $800000
             SREAD 1
: Print3     MODI 1000
             DIVI 100
             ADDI 48
             STOREI $800000
             SREAD 1
: Print2     MODI 100
             DIVI 10
             ADDI 48
             STOREI $800000
             SREAD 1
: Print1     MODI 10
             ADDI 48
             STOREI $800000
             RETURN

: hundmil DC 100000000
: onegig DC 1000000000

/*
int multnums(int n)
{
if (n>=1) return(n*multnums(n-1));
else return(1);
}

main()
{
int n;

printf("Enter n: ");
scanf("%d",&n);
printf("%d! = %d\n",n,multnums(n));
}
*/
