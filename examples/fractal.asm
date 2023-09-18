/* Sample assembly language program for the CPU designed by
   Mark Craig (mandelbrot and julia fractals) */

EQU Menu1 49
EQU Menu2 50
EQU Menu3 51
EQU Menu4 52
EQU Menu5 53
EQU Menu6 54
EQU Menu7 55
EQU Menu8 56
EQU Menu9 57
EQU Menu0 48
EQU Menua 97
EQU Menub 98

EQU limit 255
EQU off 20
EQU m $1000
EQU n $1001
EQU count $1002
EQU xgap $1003
EQU ygap $1004
EQU ac $1005
EQU bc $1006
EQU az $1007
EQU bz $1008
EQU size $1009
EQU temp $1010
EQU tempb $1011
EQU pixel $1012
EQU color $1013
EQU colorr $1014
EQU colorg $1015
EQU colorb $1016
EQU aedge $1017
EQU bedge $1018
EQU xdelta $1019
EQU ydelta $1020
EQU a $1021
EQU b $1022
EQU ClearVidScr $1023

             NOOP
             LOADI $800000      # calculate ...
             MULI 256           #  value ...
             STOREI ClearVidScr #   to clear video screen
: Menu       LOADI $800000      # clear ...
             STOREI $800000     #  TTY screen
             DCSNI Programs:
             DCSNI 
             DCSNI 1 - Mandelbrot loc. 1   7 - Julia location 4
             DCSNI 2 - Mandelbrot loc. 2   8 - Julia location 5
             DCSNI 3 - Mandelbrot loc. 3   9 - Julia location 6
             DCSNI 4 - Julia location 1    0 - Julia location 7
             DCSNI 5 - Julia location 2    a - Julia location 8
             DCSNI 6 - Julia location 3    b - Toggle size
             DCSNI 
             DCSI   Choice: 
             LOADAI 256         # wait ...
  : mLoop    DATAIN             #  for ...
             JUMPLTI mLoop      #   keypress
             SUBI 256           # remove keypress flag to get key ASCII value
             LOADAI Menu1
             JUMPEQI Choice1
             LOADAI Menu2
             JUMPEQI Choice2
             LOADAI Menu3
             JUMPEQI Choice3
             LOADAI Menu4
             JUMPEQI Choice4
             LOADAI Menu5
             JUMPEQI Choice5
             LOADAI Menu6
             JUMPEQI Choice6
             LOADAI Menu7
             JUMPEQI Choice7
             LOADAI Menu8
             JUMPEQI Choice8
             LOADAI Menu9
             JUMPEQI Choice9
             LOADAI Menu0
             JUMPEQI Choice0
             LOADAI Menua
             JUMPEQI Choicea
             LOADAI Menub
             JUMPEQI Choiceb
: Resume
             STOREI $800003     # Consume keypress
             STOREI $800000     # send key pressed to TTY
             HALT
: Choice1
             STOREI $800003
             STOREI $800000
             LOAD aedge1
             STOREI aedge
             LOAD bedge1
             STOREI bedge
             LOAD xdelta1
             STOREI xdelta
             LOAD ydelta1
             STOREI ydelta
             JUMP Mandelbrot
: Choice2
             STOREI $800003
             STOREI $800000
             LOAD aedge2
             STOREI aedge
             LOAD bedge2
             STOREI bedge
             LOAD xdelta2
             STOREI xdelta
             LOAD ydelta2
             STOREI ydelta
             JUMP Mandelbrot
: Choice3
             STOREI $800003
             STOREI $800000
             LOAD aedge3
             STOREI aedge
             LOAD bedge3
             STOREI bedge
             LOAD xdelta3
             STOREI xdelta
             LOAD ydelta3
             STOREI ydelta
             JUMP Mandelbrot
: Choice4
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a1
             STOREI a
             LOAD b1
             STOREI b
             JUMP Julia
: Choice5
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a2
             STOREI a
             LOAD b2
             STOREI b
             JUMP Julia
: Choice6
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a3
             STOREI a
             LOAD b3
             STOREI b
             JUMP Julia
: Choice7
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a4
             STOREI a
             LOAD b4
             STOREI b
             JUMP Julia
: Choice8
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a5
             STOREI a
             LOAD b5
             STOREI b
             JUMP Julia
: Choice9
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a6
             STOREI a
             LOAD b6
             STOREI b
             JUMP Julia
: Choice0
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a7
             STOREI a
             LOAD b7
             STOREI b
             JUMP Julia
: Choicea
             STOREI $800003
             STOREI $800000
             LOAD aedge4
             STOREI aedge
             LOAD bedge4
             STOREI bedge
             LOAD xdelta4
             STOREI xdelta
             LOAD ydelta4
             STOREI ydelta
             LOAD a8
             STOREI a
             LOAD b8
             STOREI b
             JUMP Julia
: Choiceb
             STOREI $800003
             STOREI $800000
             LOAD xres
             LOADA xres1
             FJUMPEQI To128
             LOAD xres1
             STOREI xres
             LOAD yres1
             STOREI yres
             DCSIN 
             DCSIN Now 256x256    
             JUMP Menu
: To128      LOAD xres2
             STOREI xres
             LOAD yres2
             STOREI yres
             DCSIN 
             DCSIN Now 128x128   
             JUMP Menu

: Mandelbrot
             LOADA ClearVidScr  # clear ...
             STOREAI $800002    #  video screen
             LOAD xdelta
             FDIV xres
             STOREI xgap        # xgap=xdelta/xres
             LOAD ydelta
             FDIV yres
             STOREI ygap        # ygap=ydelta/yres
             LOAD zero
: Loopm      STOREI m           # for (m=0;m<yres;m++)
             FMUL ygap
             FADD bedge
             STOREI bc          # bc=m*ygap+bedge
             LOAD zero
: Loopn      STOREI n           # for (n=0;n<xres;n++)
             FMUL xgap
             FADD aedge
             STOREI ac          # ac=n*xgap+aedge
             LOAD zero
             STOREI az          # az=0
             STOREI bz          # bz=0
             STOREI size        # size=0
             LOADI 0
             STOREI count       # count=0
: Loopw      LOAD size
             LOADA converge
             FJUMPGTI Exitw
             LOAD count
             LOADAI limit
             JUMPGTI Exitw      # while (size<=converge && count<=limit)
             LOAD az
             STOREI temp        # temp=az
             FMUL az
             FADD ac
             STOREI az
             LOAD bz
             FMUL bz
             STOREI tempb
             LOAD az
             FSUB tempb
             STOREI az          # az=az*az-bz*bz+ac
             LOAD bz
             FMUL temp
             FMUL two
             FADD bc
             STOREI bz          # bz=temp*bz*2+bc
             LOAD count
             ADDI 1
             STOREI count       # count++
             LOAD az
             FMUL az
             STOREI tempb
             LOAD bz
             FMUL bz
             FADD tempb
             STOREI size        # size=(az*az+bz*bz)
             JUMP Loopw         # end while
: Exitw      LOADAI limit
             LOAD count
             JUMPLTEI ok
             LOADI 0
             STOREI count       # if (count>limit) count=0
             JUMP ok2
: ok         ADDI off
             MODI 255
             ADDI 1
             STOREI count       # else count=(count+off)%255+1
: ok2
             LOAD m
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD n
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location to m*256+n
             LOAD count
             MULI 3
             ADDI Colors
             LOADAIND
             STOREAI colorb
             ADDI 1
             LOADAIND
             STOREAI colorg
             ADDI 1
             LOADAIND
             STOREAI colorr
             LOAD colorb
             MULI 65536
             ADD colorr
             STOREI color
             LOAD colorg
             MULI 256
             ADD color          # set pixel color to Colors[count*3]*65536+
             STOREI $800002     #   Colors[count*3+1]*256+Colors[count*3+2]
             LOAD n
             FADD one
             STOREI n
             LOADA xres
             FJUMPLTI Loopn     # end loop n
             FASTINTR
             LOAD m
             FADD one
             STOREI m
             LOADA yres
             FJUMPLTI Loopm     # end loop m
             JUMP Menu

: Julia
             LOADA ClearVidScr  # clear ...
             STOREAI $800002    #  video screen
             LOAD xdelta
             FDIV xres
             STOREI xgap        # xgap=xdelta/xres
             LOAD ydelta
             FDIV yres
             STOREI ygap        # ygap=ydelta/yres
             LOAD zero
: Loopmj     STOREI m           # for (m=0;m<yres;m++)
             FMUL ygap
             FADD bedge
             STOREI bc          # bc=m*ygap+bedge
             LOAD zero
: Loopnj     STOREI n           # for (n=0;n<xres;n++)
             FMUL xgap
             FADD aedge
             STOREI ac          # ac=n*xgap+aedge
             STOREI az          # az=ac
             LOAD bc
             STOREI bz          # bz=bc
             LOAD zero
             STOREI size        # size=0
             LOADI 0
             STOREI count       # count=0
: Loopwj     LOAD size
             LOADA converge
             FJUMPGTI Exitwj
             LOAD count
             LOADAI limit
             JUMPGTI Exitwj     # while (size<=converge && count<=limit)
             LOAD az
             STOREI temp        # temp=az
             FMUL az
             FADD a
             STOREI az
             LOAD bz
             FMUL bz
             STOREI tempb
             LOAD az
             FSUB tempb
             STOREI az          # az=az*az-bz*bz+a
             LOAD bz
             FMUL temp
             FMUL two
             FADD b
             STOREI bz          # bz=temp*bz*2+b
             LOAD count
             ADDI 1
             STOREI count       # count++
             LOAD az
             FMUL az
             STOREI tempb
             LOAD bz
             FMUL bz
             FADD tempb
             STOREI size        # size=(az*az+bz*bz)
             JUMP Loopwj        # end while
: Exitwj     LOADAI limit
             LOAD count
             JUMPLTEI okj
             LOADI 0
             STOREI count       # if (count>limit) count=0
             JUMP ok2j
: okj        ADDI off
             MODI 255
             ADDI 1
             STOREI count       # else count=(count+off)%255+1
: ok2j
             LOAD m
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD n
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location to m*256+n
             LOAD count
             MULI 3
             ADDI Colors
             LOADAIND
             STOREAI colorb
             ADDI 1
             LOADAIND
             STOREAI colorg
             ADDI 1
             LOADAIND
             STOREAI colorr
             LOAD colorb
             MULI 65536
             ADD colorr
             STOREI color
             LOAD colorg
             MULI 256
             ADD color          # set pixel color to Colors[count*3]*65536+
             STOREI $800002     #   Colors[count*3+1]*256+Colors[count*3+2]
             LOAD n
             FADD one
             STOREI n
             LOADA xres
             FJUMPLTI Loopnj    # end loop n
             FASTINTR
             LOAD m
             FADD one
             STOREI m
             LOADA yres
             FJUMPLTI Loopmj    # end loop m
             JUMP Menu

: aedge1 DC ~-2.0
: bedge1 DC ~-1.25
: xdelta1 DC ~3.0
: ydelta1 DC ~2.5
: aedge2 DC ~-1.061955193
: bedge2 DC ~-.264645193
: xdelta2 DC ~.000230386
: ydelta2 DC ~.000230386
: aedge3 DC ~-1.2125216
: bedge3 DC ~-.3355226
: xdelta3 DC ~.1620652
: ydelta3 DC ~.1620652
: aedge4 DC ~-1.5
: bedge4 DC ~-1.4
: xdelta4 DC ~3.0
: ydelta4 DC ~2.8
: a1 DC ~-.8
: b1 DC ~.156
: a2 DC ~-.742
: b2 DC ~.1
: a3 DC ~-.4
: b3 DC ~.6
: a4 DC ~.285
: b4 DC ~.01
: a5 DC ~0.0
: b5 DC ~-.8
: a6 DC ~-.835
: b6 DC ~-.2321
: a7 DC ~-.1
: b7 DC ~.651
: a8 DC ~.3
: b8 DC ~0.0
: xres DC ~256.0
: yres DC ~256.0
: xres2 DC ~128.0
: yres2 DC ~128.0
: xres1 DC ~256.0
: yres1 DC ~256.0
: zero DC ~0.0
: one DC ~1.0
: two DC ~2.0
: converge DC ~4.0

# Mandelbrot:
/*
int limit=255,xres=256,yres=256,m,n,count;
int off=20;
float aedge=-2.0,bedge=-1.25,xdelta=3.0,ydelta=2.5,xgap,ygap,ac,bc,az,bz,size,temp;
unsigned char dac[256][3];
 
main(argc,argv)
int argc;
char *argv[];
{
FILE *fp;
fp=fopen("p.ppm","wb");
fprintf(fp,"P6\n%d %d\n255\n",xres,yres);
xgap=xdelta/xres;
ygap=ydelta/yres;
for (m=0;m<yres;m++)
	{
	bc=m*ygap+bedge;
	for (n=0;n<xres;n++)
		{
		ac=n*xgap+aedge;
		az=0;
		bz=0;
		count=0;
		size=0;
		while (size<=4 && count<=limit)
			{
			temp=az;
			az=az*az-bz*bz+ac;
			bz=temp*bz*2+bc;
			count++;
			size=(az*az+bz*bz);
			}
		if (count>limit)
			{
			count=0;
			}
		else { count=(count+off)%255+1; }
		fputc(dac[count][0],fp);
		fputc(dac[count][1],fp);
		fputc(dac[count][2],fp);
		}
	}
fclose(fp);
}
*/

# Julia:
/*
a=.3;
b=0;
a=-.8;
b=.156;
a=-.742;
b=.1;
a=-.4;
b=.6;
a=.285;
b=.01;
a=0;
b=-.8;
a=-.835;
b=-.2321;
a=-.1;
b=.651;
*/

/*
int limit=255,xres=256,yres=256,m,n,count;
int off=20;
float aedge=-1.5,bedge=-1.4,xdelta=3.0,ydelta=2.8,xgap,ygap,ac,bc,az,bz,size,temp,a=-.835,b=-.2321;
unsigned char dac[256][3];
 
main(argc,argv)
int argc;
char *argv[];
{
FILE *fp;
fp=fopen("p.ppm","wb");
fprintf(fp,"P6\n%d %d\n255\n",xres,yres);
xgap=xdelta/xres;
ygap=ydelta/yres;
for (m=0;m<yres;m++)
	{
	bc=m*ygap+bedge;
	for (n=0;n<xres;n++)
		{
		ac=n*xgap+aedge;
		az=ac;
		bz=bc;
		count=0;
		size=0;
		while (size<=4 && count<=limit)
			{
			temp=az;
			az=az*az-bz*bz+a;
			bz=temp*bz*2+b;
			count++;
			size=(az*az+bz*bz);
			}
		if (count>limit)
			{
			count=0;
			}
		else { count=(count+off)%255+1; }
		fputc(dac[count][0],fp);
		fputc(dac[count][1],fp);
		fputc(dac[count][2],fp);
		}
	}
fclose(fp);
}
*/

: Colors
DC 0,0,0
DC 255,6,0
DC 255,12,0
DC 255,18,0
DC 255,24,0
DC 255,30,0
DC 255,36,0
DC 255,42,0
DC 255,48,0
DC 255,54,0
DC 255,60,0
DC 255,66,0
DC 255,72,0
DC 255,78,0
DC 255,84,0
DC 255,90,0
DC 255,96,0
DC 255,102,0
DC 255,108,0
DC 255,114,0
DC 255,120,0
DC 255,126,0
DC 255,132,0
DC 255,138,0
DC 255,144,0
DC 255,150,0
DC 255,156,0
DC 255,162,0
DC 255,168,0
DC 255,174,0
DC 255,180,0
DC 255,186,0
DC 255,192,0
DC 255,198,0
DC 255,204,0
DC 255,210,0
DC 255,216,0
DC 255,222,0
DC 255,228,0
DC 255,234,0
DC 255,240,0
DC 255,246,0
DC 255,252,0
DC 252,255,0
DC 246,255,0
DC 239,255,0
DC 233,255,0
DC 227,255,0
DC 221,255,0
DC 215,255,0
DC 209,255,0
DC 203,255,0
DC 197,255,0
DC 191,255,0
DC 185,255,0
DC 179,255,0
DC 173,255,0
DC 167,255,0
DC 161,255,0
DC 155,255,0
DC 149,255,0
DC 143,255,0
DC 137,255,0
DC 131,255,0
DC 125,255,0
DC 119,255,0
DC 113,255,0
DC 107,255,0
DC 101,255,0
DC 95,255,0
DC 89,255,0
DC 83,255,0
DC 77,255,0
DC 71,255,0
DC 65,255,0
DC 59,255,0
DC 53,255,0
DC 47,255,0
DC 41,255,0
DC 35,255,0
DC 29,255,0
DC 23,255,0
DC 17,255,0
DC 11,255,0
DC 5,255,0
DC 0,255,0
DC 0,255,6
DC 0,255,12
DC 0,255,18
DC 0,255,24
DC 0,255,30
DC 0,255,36
DC 0,255,42
DC 0,255,48
DC 0,255,54
DC 0,255,60
DC 0,255,66
DC 0,255,72
DC 0,255,78
DC 0,255,84
DC 0,255,90
DC 0,255,96
DC 0,255,102
DC 0,255,108
DC 0,255,114
DC 0,255,120
DC 0,255,126
DC 0,255,132
DC 0,255,138
DC 0,255,144
DC 0,255,150
DC 0,255,156
DC 0,255,162
DC 0,255,168
DC 0,255,174
DC 0,255,180
DC 0,255,186
DC 0,255,192
DC 0,255,198
DC 0,255,204
DC 0,255,210
DC 0,255,216
DC 0,255,222
DC 0,255,228
DC 0,255,234
DC 0,255,240
DC 0,255,246
DC 0,255,252
DC 0,251,255
DC 0,245,255
DC 0,239,255
DC 0,233,255
DC 0,227,255
DC 0,221,255
DC 0,215,255
DC 0,209,255
DC 0,203,255
DC 0,197,255
DC 0,191,255
DC 0,185,255
DC 0,179,255
DC 0,173,255
DC 0,167,255
DC 0,161,255
DC 0,155,255
DC 0,149,255
DC 0,143,255
DC 0,137,255
DC 0,131,255
DC 0,125,255
DC 0,119,255
DC 0,113,255
DC 0,107,255
DC 0,101,255
DC 0,95,255
DC 0,89,255
DC 0,83,255
DC 0,77,255
DC 0,71,255
DC 0,65,255
DC 0,59,255
DC 0,53,255
DC 0,47,255
DC 0,41,255
DC 0,35,255
DC 0,29,255
DC 0,23,255
DC 0,17,255
DC 0,11,255
DC 0,5,255
DC 0,0,255
DC 6,0,255
DC 12,0,255
DC 18,0,255
DC 24,0,255
DC 30,0,255
DC 36,0,255
DC 42,0,255
DC 48,0,255
DC 54,0,255
DC 60,0,255
DC 66,0,255
DC 72,0,255
DC 78,0,255
DC 84,0,255
DC 90,0,255
DC 96,0,255
DC 102,0,255
DC 108,0,255
DC 114,0,255
DC 120,0,255
DC 126,0,255
DC 132,0,255
DC 138,0,255
DC 144,0,255
DC 150,0,255
DC 156,0,255
DC 162,0,255
DC 168,0,255
DC 174,0,255
DC 180,0,255
DC 186,0,255
DC 192,0,255
DC 198,0,255
DC 204,0,255
DC 210,0,255
DC 216,0,255
DC 222,0,255
DC 228,0,255
DC 234,0,255
DC 240,0,255
DC 246,0,255
DC 252,0,255
DC 255,0,251
DC 255,0,245
DC 255,0,239
DC 255,0,233
DC 255,0,227
DC 255,0,221
DC 255,0,215
DC 255,0,209
DC 255,0,203
DC 255,0,197
DC 255,0,191
DC 255,0,185
DC 255,0,179
DC 255,0,173
DC 255,0,167
DC 255,0,161
DC 255,0,155
DC 255,0,149
DC 255,0,143
DC 255,0,137
DC 255,0,131
DC 255,0,125
DC 255,0,119
DC 255,0,113
DC 255,0,107
DC 255,0,101
DC 255,0,95
DC 255,0,89
DC 255,0,83
DC 255,0,77
DC 255,0,71
DC 255,0,65
DC 255,0,59
DC 255,0,53
DC 255,0,47
DC 255,0,41
DC 255,0,35
DC 255,0,29
DC 255,0,23
DC 255,0,17
DC 255,0,11
DC 255,0,5
DC 255,0,5
