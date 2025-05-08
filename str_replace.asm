; Get string from user and replace all 'e' with '_'
        
        org     $10000          ; Program starts at address $10000
        
        lea     prompt,A0       ; Load prompt message
        trap    #15             ; Display prompt
        dc.w    7
        
        lea     mystr,A0        ; Set pointer to string buffer
        trap    #15             ; Get string input
        DC.W    8
        
loop    move.b  (A0),D1         ; Get current character
        cmp.b   #'e',D1         ; Compare with 'e'
        bne     next            ; If not 'e', skip
        move.b  #'_',(A0)       ; Replace 'e' with '_'
        
next    ADDA    #1,A0           ; Move to next character
        cmp.b   #0,D1           ; Check if end of string (null)
        bne     loop            ; If not end, continue loop
        
        lea     mystr,A0        ; Reset string pointer
        trap    #15             ; Display modified string
        dc.w    7
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt  dc.b    "please enter a string (<30 chars): ",0 ; Prompt message
mystr   ds.b    31              ; Reserve 31 bytes for string (30 chars + null)