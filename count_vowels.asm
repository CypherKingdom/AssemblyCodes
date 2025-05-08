; Count vowels in a user input string
        
        org     $10000          ; Program starts at address $10000
        
        lea     Prompt,A0       ; Load welcome message
        trap    #15             ; Display message
        dc.w    7
        
        lea     prompt2,A0      ; Load input prompt
        trap    #15             ; Display prompt
        dc.w    7
        
        lea     ourstr,A0       ; Set pointer to string buffer
        trap    #15             ; Get string input
        dc.w    8
        
        move.l  D0,D1           ; Moving the size of string to D1
        clr.l   D2              ; Clear D2 to be used as vowel counter
        lea     ourstr,A1       ; Reset pointer to string start
        
loop    move.b  (A1),D3         ; Get current character
        adda    #1,A1           ; Move to next character
        
        cmp.b   #'a',D3         ; Compare with vowel 'a'
        beq     vowel
        cmp.b   #'e',D3         ; Compare with vowel 'e'
        beq     vowel
        cmp.b   #'o',D3         ; Compare with vowel 'o'
        beq     vowel
        cmp.b   #'u',D3         ; Compare with vowel 'u'
        beq     vowel
        cmp.b   #'i',D3         ; Compare with vowel 'i'
        beq     vowel
        cmp.b   #'y',D3         ; Compare with vowel 'y'
        beq     vowel
        
        sub.l   #1,D1           ; Decrement character counter
        bgt     loop            ; If more characters, continue loop
        bra     display         ; Otherwise, display result
        
vowel   add.l   #1,D2           ; Increment vowel counter
        sub.l   #1,D1           ; Decrement character counter
        bgt     loop            ; If more characters, continue loop
        
display lea     prompt3,A0      ; Load result message
        trap    #15             ; Display message
        dc.w    7
        
        move.l  D2,D0           ; Move vowel count to D0 for display
        trap    #15             ; Display count
        dc.w    5
        
        trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
Prompt  dc.b    "Welcome to our first assembly program",$0A,$0D,0 ; Welcome message
prompt2 dc.b    "Please enter a string (<=30 characters): ",0     ; Input prompt
ourstr  ds.b    31              ; Reserve 31 bytes for string input (30 chars + null)
prompt3 dc.b    "The number of vowels is: ",0                     ; Result message