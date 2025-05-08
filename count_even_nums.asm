; Count even numbers from 10 user inputs
        
        org     $10000          ; Program starts at address $10000
        
        move.l  #10,D3          ; D3 is used as the loop counter
        clr.l   D4              ; D4 is used as the offset for the array address
        
loop1   lea     prompt1,A0      ; Load prompt message
        trap    #15             ; Display prompt
        dc.w    7
        
        trap    #15             ; Get integer input
        dc.w    6
        
        lea     storage,A1      ; Load storage address
        add.l   D4,A1           ; Add offset to address
        move.b  D0,(A1)         ; Store user input in array
        
        add.l   #1,D4           ; Increment offset (1 because we used ds.b)
        sub.l   #1,D3           ; Decrement elements counter
        bne     loop1           ; If counter not zero, continue loop
        
        move.l  #10,D3          ; Reset counter for second loop
        clr.l   D4              ; Clear offset
        clr.l   D5              ; D5 is used as the even numbers counter
        
loop2   lea     storage,A1      ; Load storage address
        add.l   D4,A1           ; Add offset to address
        clr.l   D2              ; Clear D2 for current element
        move.b  (A1),D2         ; Fetch element from memory into D2
        
        cmp.l   #0,D2           ; Check if zero (already even)
        beq     inc             ; If zero, increment counter
        
subt    sub.l   #2,D2           ; Subtract 2 repeatedly to test if even
        bgt     subt            ; If > 0, continue subtracting
        blt     next            ; If < 0, not even, go to next element
        
inc     add.l   #1,D5           ; Increment even number counter
        
next    add.l   #1,D4           ; Move to next array position
        sub.l   #1,D3           ; Decrement loop counter
        bne     loop2           ; If counter not zero, continue loop
        
        lea     prompt2,A0      ; Load result message
        trap    #15             ; Display message
        dc.w    7
        
        move.l  D5,D0           ; Move count to D0 for display
        trap    #15             ; Display count
        dc.w    5
        
        trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt1 dc.b    "Please enter an integer (<255): ",0 ; Prompt message
prompt2 dc.b    "The number of even elements is: ",0 ; Result message
storage ds.b    10              ; Reserve 10 bytes for storing inputs