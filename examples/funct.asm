/* Sample assembly language program for the CPU designed by
   Mark Craig (function plotter) */

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
EQU Color1 $ffffff
EQU Color2 $ff1414
EQU Color3 $ffff14
EQU Color4 $14ff14
EQU Color5 $14ffff
EQU Color6 $ff14ff
EQU Color7 $2880ff
EQU Color8 $ff7f00
EQU Color9 $7fff00
EQU Color0 $14ff50
EQU Colora $8014ff

EQU ClearVidScr $1000
EQU x $1001
EQU pixel $1002
EQU y1 $1003

             NOOP
             LOADI $800000      # calculate ...
             MULI 256           #  value ...
             STOREI ClearVidScr #   to clear video screen
: Menu       LOADI $800000      # clear ...
             STOREI $800000     #  TTY screen
             DCSNI Plots:
             DCSNI 
             DCSNI 1 - Axes plot           7 - sqrt(x)
             DCSNI 2 - sin(x)              8 - ln(x)
             DCSNI 3 - cos(x)              9 - log(x)
             DCSNI 4 - tan(x)              0 - exp(x)
             DCSNI 5 - sin(x/2)+cos(x)     a - sin(x/2)*cos(x)
             DCSNI 6 - (x^2)/2+1           b - Clear screen
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
             LOADI 128
             MULI 256
: X_axis     STOREI $800001     # set pixel location to (0,128) initially
             LOADAI Color1
             STOREAI $800002    # set pixel color
             ADDI 1
             LOADAI 33023
             JUMPLTEI X_axis
             LOADI 128
: Y_axis     STOREI $800001     # set pixel location to (128,0) initially
             LOADAI Color1
             STOREAI $800002    # set pixel color
             ADDI 256
             LOADAI 65408
             JUMPLTEI Y_axis
             JUMP Menu

: Choice2
             STOREI $800003
             STOREI $800000
             LOAD Xmin
: Plotsine   STOREI x
             FSINY
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color2
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plotsine
             JUMP Menu
: Choice3
             STOREI $800003
             STOREI $800000
             LOAD Xmin
: Plotcosine STOREI x
             FCOSY
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color3
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plotcosine
             JUMP Menu
: Choice4
             STOREI $800003
             STOREI $800000
             LOAD Xmin
: Plottan    STOREI x
             FTANY
             FMUL yscale
             FADD cent
             LOADA Ymin
             FJUMPLTI noplot
             LOADA Ymax
             FJUMPGTI noplot
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color4
             STOREAI $800002    # set pixel color
: noplot     LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plottan
             JUMP Menu
: Choice5
             STOREI $800003
             STOREI $800000
             LOAD Xmin
: Plotsincos STOREI x
             FCOSY
             STOREI y1
             LOAD x
             FMUL xs
             FSINY
             FADD y1
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color5
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plotsincos
             JUMP Menu
: Choice6
             STOREI $800003
             STOREI $800000
             LOAD Xminp
: Plotparab  STOREI x
             FMUL x
             FMUL m
             FADD b
             FMUL yscale
             FADD cent
             #LOADA Ymin        # checks not needed since I reduced X range
             #FJUMPLTI noplotp
             #LOADA Ymax
             #FJUMPGTI noplotp
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color6
             STOREAI $800002    # set pixel color
: noplotp    LOAD x
             FADD dx
             LOADA Xmaxp
             FJUMPLTEI Plotparab
             JUMP Menu
: Choice7
             STOREI $800003
             STOREI $800000
             LOAD zero
: Plotsqrt   STOREI x
             FSQRTY
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color7
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plotsqrt
             JUMP Menu
: Choice8
             STOREI $800003
             STOREI $800000
             LOAD nearzero
: Plotln     STOREI x
             FLNY
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color8
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plotln
             JUMP Menu
: Choice9
             STOREI $800003
             STOREI $800000
             LOAD nearzero
: Plotlog    STOREI x
             FLOGY
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color9
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plotlog
             JUMP Menu
: Choice0
             STOREI $800003
             STOREI $800000
             LOAD Xmin
: Plotexp    STOREI x
             FEXPY
             FMUL yscale
             FADD cent
             #LOADA Ymin        # checks not needed since I reduced X range
             #FJUMPLTI noplote
             #LOADA Ymax
             #FJUMPGTI noplote
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Color0
             STOREAI $800002    # set pixel color
: noplote    LOAD x
             FADD dx
             LOADA Xmaxe
             FJUMPLTEI Plotexp
             JUMP Menu
: Choicea
             STOREI $800003
             STOREI $800000
             LOAD Xmin
: Plots*c    STOREI x
             FCOSY
             STOREI y1
             LOAD x
             FMUL xs
             FSINY
             FMUL y1
             FMUL yscale
             FADD cent
             FPTOINTY
             MULI 256
             STOREI pixel
             LOAD x
             FMUL xscale
             FADD cent
             FPTOINTY
             ADD pixel
             STOREI $800001     # set pixel location
             LOADAI Colora
             STOREAI $800002    # set pixel color
             LOAD x
             FADD dx
             LOADA Xmax
             FJUMPLTEI Plots*c
             JUMP Menu
: Choiceb
             STOREI $800003
             STOREI $800000
             LOADA ClearVidScr  # clear ...
             STOREAI $800002    #  video screen
             JUMP Menu

: zero DC ~0.0
: nearzero DC ~0.0001
: Xmin DC ~-10.0
: Xmax DC ~10.0
: Ymin DC ~0.0
: Ymax DC ~255.0
: Xminp DC ~-3.28125
: Xmaxp DC ~3.28125
: Xmaxe DC ~1.8359375
#: dx DC ~.078125
: dx DC ~.0390625
: xscale DC ~12.8
: yscale DC ~-20.0
: cent DC ~128.0
: xs DC ~.5
: m DC ~.5
: b DC ~1.0
