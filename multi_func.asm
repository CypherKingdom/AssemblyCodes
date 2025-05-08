; Multi-option program - Fibonacci sequence, factorial calculation, and sign checking
        
        org     $10000          ; Program starts at address $10000
        
        clr.l   D0              ; Will be used for I/O operations
        clr.l   D1              ; Will be used to store past element in Fibonacci sequence
        clr.l   D2              ; Will be used for sum of Fibonacci sequence
        clr.l   D3              ; Will be used for factorial product
        clr.l   D4              ; Will be used for sign checking
        clr.l   D5              ; Might be used as temporary register
        
invalid  lea     mainprompt,A0  ; Load main menu prompt
        trap    #15             ; Display prompt
        dc.w    7
        
        trap    #15             ; Get user choice
        dc.w    6
        
        move.b  D0,input        ; Store user choice
        cmp.b   #1,input        ; Check for Fibonacci option
        beq     fibblock
        cmp.b   #2,input        ; Check for factorial option
        beq     factblock
        cmp.b   #3,input        ; Check for sign check option
        beq     scblock
        cmp.b   #0,input        ; Check for exit option
        beq     exit
        bra     invalid         ; If invalid, branch back to main block

fibblock lea     fibprompt,A0   ; Load Fibonacci prompt
        trap    #15             ; Display prompt
        dc.w    7
        
        trap    #15             ; Get integer input
        dc.w    6
        
        move.w  D0,fibinput     ; Store input
        cmp.w   #0,fibinput     ; If input is 0, just print 0
        beq     print_zero
        
        move.w  #0,D1           ; First Fibonacci number (Fib(0) = 0)
        move.w  #1,D2           ; Second Fibonacci number (Fib(1) = 1)
        
fib_loop cmp.w   #1,fibinput     ; If fibinput is 1, stop
        beq     display_result
        
        add.w   D1,D2           ; F(n) = F(n-1) + F(n-2)
        move.w  D2,D1           ; Shift: New F(n-1) = old F(n)
        sub.w   #1,fibinput     ; Decrement counter
        bra     fib_loop        ; Loop until fibinput reaches 1
        
print_zero
        lea     fiboutput,A0    ; Load result message
        trap    #15             ; Display message
        dc.w    7
        
        move.w  #0,D0           ; Print 0
        trap    #15             ; Display result
        dc.w    5
        
        bra     exit            ; Exit program
        
display_result
        lea     fiboutput,A0    ; Load result message
        trap    #15             ; Display message
        dc.w    7
        
        move.w  D2,D0           ; Move final Fibonacci number to D0
        trap    #15             ; Display result
        dc.w    5
        
        bra     exit            ; Exit program
        
factblock
        lea     factprompt,A0   ; Load factorial prompt
        trap    #15             ; Display prompt
        dc.w    7
        
        trap    #15             ; Get integer input
        dc.w    6
        
        move.w  D0,factinput    ; Store input in factinput
        move.w  #1,D3           ; Initialize D3 as 1 since we are multiplying
        
fact_loop
        cmp.w   #1,factinput    ; Check if reached the end of factorial
        beq     display_fact
        
        mulu.w  factinput,D3    ; Multiply and store factinput in D3
        sub.w   #1,factinput    ; Decrement counter
        bra     fact_loop       ; Continue loop
        
display_fact
        lea     factoutput,A0   ; Load result message
        trap    #15             ; Display message
        dc.w    7
        
        move.w  D3,D0           ; Move number from D3 to D0 to display
        trap    #15             ; Display result
        dc.w    5
        
        bra     exit            ; Exit program
        
scblock  lea     scprompt,A0    ; Load sign check prompt
        trap    #15             ; Display prompt
        dc.w    7
        
        trap    #15             ; Get integer input
        dc.w    6
        
        move.w  D0,D4           ; Store input in D4
        tst     D4              ; Test sign of D4
        bmi     negdisplay      ; Branch if negative
        
        lea     posoutput,A0    ; Load positive result message
        trap    #15             ; Display message
        dc.w    7
        
        bra     exit            ; Exit program
        
negdisplay
        lea     negoutput,A0    ; Load negative result message
        trap    #15             ; Display message
        dc.w    7
        
        bra     exit            ; Exit program
        
exit    trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
        
mainprompt dc.b    'Please enter 1 for Fibonacci sequence, 2 for factorial, 3 for sign check or 0 to quit: ',0
fibprompt  dc.b    'Enter the number to check the Fibonacci sequence: ',0
factprompt dc.b    'Enter the number (> 0) to calculate the factorial: ',0    ; Case where n = 0 is not handled
scprompt   dc.b    'Enter the number to check the sign: ',0
fiboutput  dc.b    'Fibonacci sequence value is: ',0
factoutput dc.b    'Factorial of your number is: ',0
posoutput  dc.b    'The number is positive!',0
negoutput  dc.b    'The number is negative!',0
input      ds.b    1            ; For menu selection input
fibinput   ds.w    1            ; For Fibonacci sequence input
factinput  ds.w    1            ; For factorial input
scinput    ds.w    1            ; For sign checking input
