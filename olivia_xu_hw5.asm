; This subroutine computes the GCD of two unsigned 8-bit integers using
; Euclid's algorithm by repeated subtraction.
;
; The input values are stored in memory in Ain and Bin.  The subroutine makes
; working copies (a and b) and returns the GCD in the accumulator.
;
; Revision History
;    11 Feb 26   Olivia Xu        Initial revision
;    11 Feb 26   Olivia Xu        Updated comments / formatting


            start:			    ;initialize variables
                LDD   b         ;get the value of b in accumulator
                CMPI  0         ;check if b is 0
                JZ    Done      ;if b is now 0, we're done
                NOP             ;

            GCDLoop:			;loop, computing GCD
                LDD   a         ;get the value of a in accumulator
                CMP   b         ;compare the value in accumulator (a) with b
                JB    Swap      ;if a < b
                NOP             ;
                SUB   b         ;subtract b from a
                STD   a         ;store the value in a
                JMP   GCDLoop   ;repeat 
                NOP             ;

            Swap:
                LDD   a		    ;get a
                TAX			    ;and put it in X temporarily
                LDD   b		    ;now get b
                STD   a		    ;and store it in a
                TXA			    ;get original a back
                STD   b		    ;and store it in b
                JMP   start     ;jump back to start to repeat
                NOP             ;

            Done:			    ;
                LDD   a			;GCD is a
                RTS             ;and return


; Variables

        a       DB    ?         ;first input value
        b       DB    ?         ;second input value