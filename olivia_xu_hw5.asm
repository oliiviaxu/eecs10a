; This subroutine computes the GCD of two 8-bit integers using
; Euclid's algorithm by repeated subtraction.
;
; Inputs:
;    a - first 8-bit value (stored in memory)
;    b - second 8-bit value (stored in memory)
;
; Outputs:
;    Accumulator - contains the GCD of a and b on return
;
; Revision History
;    11 Feb 26   Olivia Xu        Initial revision
;    11 Feb 26   Olivia Xu        Updated comments / formatting


            start:			    ;check if b is zero
                LDD   b         ;get the value of b in accumulator
                CMPI  0         ;check if b is 0
                JZ    Done      ;if b is now 0, we're done
                NOP             ;branch slot

            GCDLoop:			;loop, computing GCD
                LDD   a         ;get the value of a in accumulator
                CMP   b         ;compare the value in accumulator (a) with b
                JB    Swap      ;if a < b, swap
                NOP             ;branch slot
                SUB   b         ;subtract b from a
                STD   a         ;store the value in a
                JMP   GCDLoop   ;repeat 
                NOP             ;branch slot

            Swap:
                LDD   a		    ;get a
                TAX			    ;and put it in X temporarily
                LDD   b		    ;now get b
                STD   a		    ;and store it in a
                TXA			    ;get original a back
                STD   b		    ;and store it in b
                JMP   start     ;jump back to start to repeat
                NOP             ;branch slot

            Done:			    
                LDD   a			;GCD is a
                RTS             ;and return


; Variables

        a       DB    ?         ;first input value
        b       DB    ?         ;second input value