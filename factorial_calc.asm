; Calculate factorial of a user input integer
        
        org     $10000          ; Program starts at address $10000
        
        lea     prompt1,A0      ; Load prompt message
        trap    #15             ; Display prompt
        dc.w    7
        
        trap    #15             ; Get integer input
        dc.w    6
        
        move.l  #1,D1           ; Initialize D1 to 1 for factorial calculation
        
loop    cmp.l   #0,D0           ; Check if counter reached zero
        beq     result          ; If zero, display result
        
        mulu.l  D0,D1           ; Multiply current factorial by counter
        sub.l   #1,D0           ; Decrement counter
        bra     loop            ; Continue loop
        
result  lea     prompt2,A0      ; Load result message
        trap    #15             ; Display message
        dc.w    7
        
        move.l  D1,D0           ; Move factorial result to D0 for display
        trap    #15             ; Display result
        dc.w    5
        
        trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt1 dc.b    "Please enter an integer: ",0   ; Prompt message
prompt2 dc.b    "The factorial is: ",0          ; Result message