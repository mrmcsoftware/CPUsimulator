/* Sample assembly language program for the CPU designed by
   Mark Craig (testing some I/O stuff) */

EQU Menu1 49
EQU Menu2 50
EQU Menu3 51
EQU Menu4 52

             NOOP
             LOADI $800000       # calculate ...
             MULI 256            #  value ...
             STOREI ClearVidScr  #   to clear video screen
: Menu       LOADI $800000       # clear ...
             STOREI $800000      #  TTY screen
             DCSNI Programs:
             DCSNI 
             DCSNI 1 - Hello World
             DCSNI 2 - KITT/Cylon effect
             DCSNI 3 - Running lights
             DCSNI 4 - Five Tones
             DCSNI 
             DCSI   Choice: 
             LOADAI 256          # wait ...
  : Loop     DATAIN              #  for ...
             JUMPLTI Loop        #   keypress
             SUBI 256            # remove keypress flag to get key ASCII value
             LOADAI Menu1
             JUMPEQI Choice1
             LOADAI Menu2
             JUMPEQI Choice2
             LOADAI Menu3
             JUMPEQI Choice3
             LOADAI Menu4
             JUMPEQI Choice4
: Resume
             STOREAI $800003     # Consume keypress
             STOREI $800000     # send key pressed to TTY
             HALT
: Choice1
             STOREAI $800003
             STOREAI $800000
             LOADAI 13
             STOREAI $800000
             LOADI Message
             STOREI MessPtr
             LOADAIND            # load into A the value pointed to by MessPtr
  : Loop3
             LOAD MessPtr
             STOREAI $800000
             ADDI 1
             STOREI MessPtr
             LOADAIND
             LOADI 0
             JUMPEQI Loop2
             JUMP Loop3
  : Loop2
             LOADI $00001 STOREI $800006
             LOADI $10001 STOREI $800006
             LOADI $20001 STOREI $800006
             LOADI $30001 STOREI $800006
             LOADI $40001 STOREI $800006
             LOADI $50001 STOREI $800006
             LOADI $60001 STOREI $800006
             LOADI $00002 STOREI $800006
             LOADI $10002 STOREI $800006
             LOADI $20002 STOREI $800006
             LOADI $30003 STOREI $800006
             LOADI $40002 STOREI $800006
             LOADI $50002 STOREI $800006
             LOADI $60002 STOREI $800006
             LOADI $00004 STOREI $800006
             LOADI $10004 STOREI $800006
             LOADI $20004 STOREI $800006
             LOADI $30007 STOREI $800006
             LOADI $40004 STOREI $800006
             LOADI $50004 STOREI $800006
             LOADI $60004 STOREI $800006
             LOADI $00008 STOREI $800006
             LOADI $10008 STOREI $800006
             LOADI $20008 STOREI $800006
             LOADI $3000f STOREI $800006
             LOADI $40008 STOREI $800006
             LOADI $50008 STOREI $800006
             LOADI $60008 STOREI $800006
             LOADI $00011 STOREI $800006
             LOADI $10011 STOREI $800006
             LOADI $20011 STOREI $800006
             LOADI $3001f STOREI $800006
             LOADI $40011 STOREI $800006
             LOADI $50011 STOREI $800006
             LOADI $60011 STOREI $800006
             LOADI $00022 STOREI $800006
             LOADI $10022 STOREI $800006
             LOADI $20022 STOREI $800006
             LOADI $3003e STOREI $800006
             LOADI $40022 STOREI $800006
             LOADI $50022 STOREI $800006
             LOADI $60022 STOREI $800006
             LOADI $00044 STOREI $800006
             LOADI $10044 STOREI $800006
             LOADI $20044 STOREI $800006
             LOADI $3007c STOREI $800006
             LOADI $40044 STOREI $800006
             LOADI $50044 STOREI $800006
             LOADI $60044 STOREI $800006
             LOADI $00089 STOREI $800006
             LOADI $10089 STOREI $800006
             LOADI $20089 STOREI $800006
             LOADI $300f9 STOREI $800006
             LOADI $40089 STOREI $800006
             LOADI $50089 STOREI $800006
             LOADI $60089 STOREI $800006
             LOADI $00113 STOREI $800006
             LOADI $10112 STOREI $800006
             LOADI $20112 STOREI $800006
             LOADI $301f3 STOREI $800006
             LOADI $40112 STOREI $800006
             LOADI $50112 STOREI $800006
             LOADI $60113 STOREI $800006
             LOADI $00227 STOREI $800006
             LOADI $10224 STOREI $800006
             LOADI $20224 STOREI $800006
             LOADI $303e7 STOREI $800006
             LOADI $40224 STOREI $800006
             LOADI $50224 STOREI $800006
             LOADI $60227 STOREI $800006
             LOADI $0044f STOREI $800006
             LOADI $10448 STOREI $800006
             LOADI $20448 STOREI $800006
             LOADI $307cf STOREI $800006
             LOADI $40448 STOREI $800006
             LOADI $50448 STOREI $800006
             LOADI $6044f STOREI $800006
             LOADI $0089f STOREI $800006
             LOADI $10890 STOREI $800006
             LOADI $20890 STOREI $800006
             LOADI $30f9e STOREI $800006
             LOADI $40890 STOREI $800006
             LOADI $50890 STOREI $800006
             LOADI $6089f STOREI $800006
             LOADI $0013e STOREI $800006
             LOADI $10120 STOREI $800006
             LOADI $20120 STOREI $800006
             LOADI $30f3c STOREI $800006
             LOADI $40120 STOREI $800006
             LOADI $50120 STOREI $800006
             LOADI $6013e STOREI $800006
             LOADI $0027c STOREI $800006
             LOADI $10240 STOREI $800006
             LOADI $20240 STOREI $800006
             LOADI $30e78 STOREI $800006
             LOADI $40240 STOREI $800006
             LOADI $50240 STOREI $800006
             LOADI $6027c STOREI $800006
             LOADI $004f9 STOREI $800006
             LOADI $10481 STOREI $800006
             LOADI $20481 STOREI $800006
             LOADI $30cf1 STOREI $800006
             LOADI $40481 STOREI $800006
             LOADI $50481 STOREI $800006
             LOADI $604f9 STOREI $800006
             LOADI $009f2 STOREI $800006
             LOADI $10902 STOREI $800006
             LOADI $20902 STOREI $800006
             LOADI $309e2 STOREI $800006
             LOADI $40902 STOREI $800006
             LOADI $50902 STOREI $800006
             LOADI $609f3 STOREI $800006
             LOADI $003e4 STOREI $800006
             LOADI $10204 STOREI $800006
             LOADI $20204 STOREI $800006
             LOADI $303c4 STOREI $800006
             LOADI $40204 STOREI $800006
             LOADI $50204 STOREI $800006
             LOADI $603e7 STOREI $800006
             LOADI $007c8 STOREI $800006
             LOADI $10408 STOREI $800006
             LOADI $20408 STOREI $800006
             LOADI $30788 STOREI $800006
             LOADI $40408 STOREI $800006
             LOADI $50408 STOREI $800006
             LOADI $607cf STOREI $800006
             LOADI $00f90 STOREI $800006
             LOADI $10810 STOREI $800006
             LOADI $20810 STOREI $800006
             LOADI $30f10 STOREI $800006
             LOADI $40810 STOREI $800006
             LOADI $50810 STOREI $800006
             LOADI $60f9f STOREI $800006
             LOADI $00f20 STOREI $800006
             LOADI $10020 STOREI $800006
             LOADI $20020 STOREI $800006
             LOADI $30e20 STOREI $800006
             LOADI $40020 STOREI $800006
             LOADI $50020 STOREI $800006
             LOADI $60f3e STOREI $800006
             LOADI $00e40 STOREI $800006
             LOADI $10040 STOREI $800006
             LOADI $20040 STOREI $800006
             LOADI $30c40 STOREI $800006
             LOADI $40040 STOREI $800006
             LOADI $50040 STOREI $800006
             LOADI $60e7c STOREI $800006
             LOADI $00c81 STOREI $800006
             LOADI $10081 STOREI $800006
             LOADI $20081 STOREI $800006
             LOADI $30881 STOREI $800006
             LOADI $40081 STOREI $800006
             LOADI $50081 STOREI $800006
             LOADI $60cf9 STOREI $800006
             LOADI $00902 STOREI $800006
             LOADI $10102 STOREI $800006
             LOADI $20102 STOREI $800006
             LOADI $30102 STOREI $800006
             LOADI $40102 STOREI $800006
             LOADI $50102 STOREI $800006
             LOADI $609f3 STOREI $800006
             LOADI $00204 STOREI $800006
             LOADI $10204 STOREI $800006
             LOADI $20204 STOREI $800006
             LOADI $30204 STOREI $800006
             LOADI $40204 STOREI $800006
             LOADI $50204 STOREI $800006
             LOADI $603e7 STOREI $800006
             LOADI $00408 STOREI $800006
             LOADI $10408 STOREI $800006
             LOADI $20408 STOREI $800006
             LOADI $30408 STOREI $800006
             LOADI $40408 STOREI $800006
             LOADI $50408 STOREI $800006
             LOADI $607cf STOREI $800006
             LOADI $00810 STOREI $800006
             LOADI $10810 STOREI $800006
             LOADI $20810 STOREI $800006
             LOADI $30810 STOREI $800006
             LOADI $40810 STOREI $800006
             LOADI $50810 STOREI $800006
             LOADI $60f9f STOREI $800006
             LOADI $00020 STOREI $800006
             LOADI $10020 STOREI $800006
             LOADI $20020 STOREI $800006
             LOADI $30020 STOREI $800006
             LOADI $40020 STOREI $800006
             LOADI $50020 STOREI $800006
             LOADI $60f3e STOREI $800006
             LOADI $00040 STOREI $800006
             LOADI $10040 STOREI $800006
             LOADI $20041 STOREI $800006
             LOADI $30041 STOREI $800006
             LOADI $40041 STOREI $800006
             LOADI $50040 STOREI $800006
             LOADI $60e7c STOREI $800006
             LOADI $00080 STOREI $800006
             LOADI $10081 STOREI $800006
             LOADI $20082 STOREI $800006
             LOADI $30082 STOREI $800006
             LOADI $40082 STOREI $800006
             LOADI $50081 STOREI $800006
             LOADI $60cf8 STOREI $800006
             LOADI $00101 STOREI $800006
             LOADI $10102 STOREI $800006
             LOADI $20104 STOREI $800006
             LOADI $30104 STOREI $800006
             LOADI $40104 STOREI $800006
             LOADI $50102 STOREI $800006
             LOADI $609f1 STOREI $800006
             LOADI $00203 STOREI $800006
             LOADI $10204 STOREI $800006
             LOADI $20208 STOREI $800006
             LOADI $30208 STOREI $800006
             LOADI $40208 STOREI $800006
             LOADI $50204 STOREI $800006
             LOADI $603e3 STOREI $800006
             LOADI $00407 STOREI $800006
             LOADI $10408 STOREI $800006
             LOADI $20410 STOREI $800006
             LOADI $30410 STOREI $800006
             LOADI $40410 STOREI $800006
             LOADI $50408 STOREI $800006
             LOADI $607c7 STOREI $800006
             LOADI $0080e STOREI $800006
             LOADI $10811 STOREI $800006
             LOADI $20820 STOREI $800006
             LOADI $30820 STOREI $800006
             LOADI $40820 STOREI $800006
             LOADI $50811 STOREI $800006
             LOADI $60f8e STOREI $800006
             LOADI $0001c STOREI $800006
             LOADI $10022 STOREI $800006
             LOADI $20041 STOREI $800006
             LOADI $30041 STOREI $800006
             LOADI $40041 STOREI $800006
             LOADI $50022 STOREI $800006
             LOADI $60f1c STOREI $800006
             LOADI $00038 STOREI $800006
             LOADI $10044 STOREI $800006
             LOADI $20082 STOREI $800006
             LOADI $30082 STOREI $800006
             LOADI $40082 STOREI $800006
             LOADI $50044 STOREI $800006
             LOADI $60e38 STOREI $800006
             LOADI $00070 STOREI $800006
             LOADI $10088 STOREI $800006
             LOADI $20104 STOREI $800006
             LOADI $30104 STOREI $800006
             LOADI $40104 STOREI $800006
             LOADI $50088 STOREI $800006
             LOADI $60c70 STOREI $800006
             LOADI $000e0 STOREI $800006
             LOADI $10110 STOREI $800006
             LOADI $20208 STOREI $800006
             LOADI $30208 STOREI $800006
             LOADI $40208 STOREI $800006
             LOADI $50110 STOREI $800006
             LOADI $608e0 STOREI $800006
             LOADI $001c0 STOREI $800006
             LOADI $10220 STOREI $800006
             LOADI $20410 STOREI $800006
             LOADI $30410 STOREI $800006
             LOADI $40410 STOREI $800006
             LOADI $50220 STOREI $800006
             LOADI $601c0 STOREI $800006
             LOADI $00380 STOREI $800006
             LOADI $10440 STOREI $800006
             LOADI $20820 STOREI $800006
             LOADI $30820 STOREI $800006
             LOADI $40820 STOREI $800006
             LOADI $50440 STOREI $800006
             LOADI $60380 STOREI $800006
             LOADI $00700 STOREI $800006
             LOADI $10880 STOREI $800006
             LOADI $20040 STOREI $800006
             LOADI $30040 STOREI $800006
             LOADI $40040 STOREI $800006
             LOADI $50880 STOREI $800006
             LOADI $60700 STOREI $800006
             LOADI $00e00 STOREI $800006
             LOADI $10100 STOREI $800006
             LOADI $20080 STOREI $800006
             LOADI $30080 STOREI $800006
             LOADI $40080 STOREI $800006
             LOADI $50100 STOREI $800006
             LOADI $60e00 STOREI $800006
             LOADI $00c00 STOREI $800006
             LOADI $10200 STOREI $800006
             LOADI $20100 STOREI $800006
             LOADI $30100 STOREI $800006
             LOADI $40100 STOREI $800006
             LOADI $50200 STOREI $800006
             LOADI $60c00 STOREI $800006
             LOADI $00800 STOREI $800006
             LOADI $10400 STOREI $800006
             LOADI $20200 STOREI $800006
             LOADI $30200 STOREI $800006
             LOADI $40200 STOREI $800006
             LOADI $50400 STOREI $800006
             LOADI $60800 STOREI $800006
             LOADI $00000 STOREI $800006
             LOADI $10800 STOREI $800006
             LOADI $20400 STOREI $800006
             LOADI $30400 STOREI $800006
             LOADI $40400 STOREI $800006
             LOADI $50800 STOREI $800006
             LOADI $60000 STOREI $800006
             LOADI $00000 STOREI $800006
             LOADI $10000 STOREI $800006
             LOADI $20800 STOREI $800006
             LOADI $30800 STOREI $800006
             LOADI $40800 STOREI $800006
             LOADI $50000 STOREI $800006
             LOADI $60000 STOREI $800006
             LOADI $00000 STOREI $800006
             LOADI $10000 STOREI $800006
             LOADI $20000 STOREI $800006
             LOADI $30000 STOREI $800006
             LOADI $40000 STOREI $800006
             LOADI $50000 STOREI $800006
             LOADI $60000 STOREI $800006
             JUMP Menu
: Message    DC 13
             DCSN0  Hello World  
: Choice2
             STOREAI $800003
             STOREAI $800000
             LOADAI 2
  : Top      LOADI 1
             STROBE
  : Loop1a   MULI 2
             SKIPNEG
             JUMP Loop1a
  : Loop2a   DIVI 2
             JUMPEQI Top
             JUMP Loop2a
: Choice3
             STOREAI $800003
             STOREAI $800000
  : Loop1b   LOADI 1
             STROBE
  : Loop2b   MULI 2
             SKIPNEG
             JUMP Loop2b
             JUMP Loop1b
: Choice4
             STOREAI $800003
             STOREAI $800000
             DCSNI 
             DCSNI 
             DCSNI  "If everything's ready here on the Dark Side
             DCSNI   of the Moon... play the five tones."
             LOADI 128 STOREI $800004
             LOADI 127          # set ...
             STOREI $800005     #  volume
             LOADI 74 # 587     # set ...
             STOREI $800004     #  note
             LOADI $20004       # set LED matrix pattern ...
             STOREI $800006     #  for row #2 (starting from 0)
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $20000       # clear ...
             STOREI $800006     #  row #2
             LOADI 76 # 659
             STOREI $800004
             LOADI $20001
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $20000
             STOREI $800006
             LOADI 72 # 523
             STOREI $800004
             LOADI $20010
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $20000
             STOREI $800006
             LOADI 60 # 262
             STOREI $800004
             LOADI $40200
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $40000
             STOREI $800006
             LOADI 67 # 392
             STOREI $800004
             LOADI $00040
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $00000
             STOREI $800006
             LOADI 0            # turn off...
             STOREI $800005     #  sound
             DCSNI 
             DCSNI    Close Encounters of the Third Kind
             DCSNI      John Williams
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI 128 STOREI $800004
             LOADI 127
             STOREI $800005
             LOADI 98 # 2349
             STOREI $800004
             LOADI $20004
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $20000
             STOREI $800006
             LOADI 100 # 2637
             STOREI $800004
             LOADI $20001
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $20000
             STOREI $800006
             LOADI 96 # 2093
             STOREI $800004
             LOADI $20010
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $20000
             STOREI $800006
             LOADI 84 # 1046
             STOREI $800004
             LOADI $40200
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $40000
             STOREI $800006
             LOADI 91 # 1568
             STOREI $800004
             LOADI $00040
             STOREI $800006
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP NOOP
             LOADI $00000
             STOREI $800006
             LOADI 0
             STOREI $800005
             DCSNI 
             JUMP Menu

DS 256 # for safety
: MessPtr      DS 1
: ClearVidScr  DS 1
