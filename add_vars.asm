; Adding two variables and storing the result
; Notes: The add automatically takes the 16 bits format (all non extension commands)
; Adding 2 variables that can be of same size could lead to an overflow hence the use of 16 bit

        org     $10000          ; Program starts at address $10000
        
        move.b  #9,value1       ; Initialize value1 with 9
        move.b  #15,value2      ; Initialize value2 with 15
        clr.l   D0              ; Clear register D0
        clr.l   D1              ; Clear register D1
        move.b  value1,D0       ; Move value1 to D0
        move.b  value2,D1       ; Move value2 to D1
        add     D1,D0           ; Add D1 to D0 (16-bit operation by default)
        move.w  D0,result       ; Store result in memory
        
        lea     prompt,A0       ; Load effective address of prompt into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        move.w  result,D0       ; Move result to D0 for display
        trap    #15             ; Call system function
        dc.w    5               ; Display integer in D0
        
        trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt  dc.b    "The sum is: ",0 ; Null-terminated string
value1  ds.b    1               ; Reserve 1 byte for value1
value2  ds.b    1               ; Reserve 1 byte for value2
result  ds.w    1               ; Reserve 2 bytes (word) for result