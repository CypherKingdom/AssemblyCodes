; Finding the Greatest Common Divisor (GCD) of two integers
        
        org     $10000          ; Program starts at address $10000
        
        lea     prompt1,A0      ; Load effective address of prompt1 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        trap    #15             ; Call system function
        dc.w    6               ; Get integer input into D0
        move    D0,D2           ; Store first input in D2
        
        lea     prompt2,A0      ; Load effective address of prompt2 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        trap    #15             ; Call system function
        dc.w    6               ; Get integer input into D0
        move    D0,D3           ; Store second input in D3
        
loop    cmp     D2,D3           ; Compare values in D2 and D3
        beq     display         ; If equal, go to display (GCD found)
        blt     ali             ; If D3 < D2, go to ali
        sub     D2,D3           ; Subtract D2 from D3
        bra     loop            ; Go back to loop
        
ali     sub     D3,D2           ; Subtract D3 from D2 (else block)
        bra     loop            ; Go back to loop
        
display move    D2,D0           ; Move GCD to D0 for display
        lea     prompt3,A0      ; Load effective address of prompt3 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        trap    #15             ; Call system function
        dc.w    5               ; Display integer in D0
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt1 dc.b    "Please enter integer 'a': ",0  ; Null-terminated string
prompt2 dc.b    "Please enter integer 'b': ",0  ; Null-terminated string
prompt3 dc.b    "The gcd of the integers is: ",0 ; Null-terminated string
value1  ds.w    1               ; Reserve 2 bytes for value1
value2  ds.w    1               ; Reserve 2 bytes for value2