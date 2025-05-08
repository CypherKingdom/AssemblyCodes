; Check if a word is a palindrome
        
        org     $10000          ; Program starts at address $10000
        
        lea     prompt1,A0      ; Load prompt message
        trap    #15             ; Display prompt
        dc.w    7
        
        lea     myword,A0       ; Set pointer to word buffer
        trap    #15             ; Get string input
        dc.w    8
        
        move.l  A0,A1           ; A0 and A1 both point to first char
        Add.l   D0,A1           ; A1 points to one address beyond last char
        sub.l   #1,A1           ; A1 now points to last char
        
loop    move.b  (A0),D1         ; Get char from start
        move.b  (A1),D2         ; Get char from end
        cmp.b   D1,D2           ; Compare characters
        bne     notpal          ; If not equal, not a palindrome
        
        adda    #1,A0           ; Move start pointer forward
        suba    #1,A1           ; Move end pointer backward
        cmp.l   A0,A1           ; Check if pointers have crossed
        bgt     loop            ; If not crossed, continue checking
        
        lea     prompt2,A0      ; Load palindrome message
        Trap    #15             ; Display message
        dc.w    7
        bra     fin             ; Skip to end
        
notpal  lea     prompt3,A0      ; Load not palindrome message
        trap    #15             ; Display message
        dc.w    7
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt1 dc.b    "please enter a word (<10 chars): ",0 ; Prompt message
prompt2 dc.b    "this is palindrome",0         ; Palindrome message
prompt3 dc.b    "this is not palindrome",0     ; Not palindrome message
myword  ds.b    11              ; Reserve 11 bytes for word (10 chars + null)