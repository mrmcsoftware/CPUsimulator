/* Sample Clock assembly language program for the CPU designed by
   Mark Craig */

DCSNI Be sure to have "Display Clock" checked

: Loop       STOREAI $800007     # get time
             DATAIN
             JUMP Loop
