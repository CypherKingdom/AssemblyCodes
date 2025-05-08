; Process an array to find minimum value and calculate sum
        
        org     $10000          ; Program starts at address $10000
        
        clr     D2              ; Clear D2 (used for the sum)
        LEA     INTARR,A1       ; Load effective address of array into A1
        move.b  (A1),D1         ; Move first element to D1 (for minimum)
        clr     D3              ; Clear D3 (temporary register)
        
loop    move.b  (A1),D3         ; Move current element to D3
        cmp.b   #0,D3           ; Compare with 0 (end marker)
        beq     store           ; If 0, end of array, store results
        
        cmp.b   D1,D3           ; Compare current with minimum
        bgt     continue        ; If current > minimum, continue
        move.b  D3,D1           ; Otherwise, update minimum
        
continue add    D3,D2           ; Add current element to sum
        ADDA    #1,A1           ; Move to next array element
        bra     loop            ; Repeat loop
        
store   move.b  D1,SMALL        ; Store minimum value
        move    D2,SUMARR       ; Store sum
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
INTARR  dc.b    25,36,7,9,0     ; Integer array with 0 as terminator
SMALL   ds.b    1               ; Reserve 1 byte for minimum value
SUMARR  ds.w    1               ; Reserve 2 bytes for sum