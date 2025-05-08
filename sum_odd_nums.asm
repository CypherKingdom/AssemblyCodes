; Sum of odd numbers between 10 and 25
        
        org     $10000          ; Program starts at address $10000
        
        clr     D2              ; Clear D2 (used for the sum)
        move.l  #10,D1          ; Initialize counter to 10
        
loop    BTST    #0,D1           ; Test bit 0 (LSB)
        BEQ     even            ; If bit 0 is 0 (even), skip
        ADD.l   D1,D2           ; Add odd number to sum
        
even    ADD.l   #1,D1           ; Increment counter
        cmp.l   #25,D1          ; Compare counter with 25
        BLE     loop            ; If counter <= 25, continue loop
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code