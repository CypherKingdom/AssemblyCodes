; Getting two inputs from user and finding the minimum value
        
        org     $10000          ; Program starts at address $10000
        
        lea     prompt1,A0      ; Load effective address of prompt1 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        trap    #15             ; Call system function
        dc.w    6               ; Get integer input into D0
        move    D0,D1           ; Store first input in D1
        
        lea     prompt2,A0      ; Load effective address of prompt2 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        trap    #15             ; Call system function
        dc.w    6               ; Get integer input into D0
        
        cmp.b   D0,D1           ; Compare values in D0 and D1
        blt     skip            ; Branch if D1 < D0
        move.b  D1,result       ; Store D1 in result
        bra     fin             ; Branch to end
        
skip    move.b  D0,result       ; Store D0 in result
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt1 dc.b    "Please enter the value 'a': ",0 ; Null-terminated string
prompt2 dc.b    "Please enter the value 'b': ",0 ; Null-terminated string
result  ds.b    1               ; Reserve 1 byte for result