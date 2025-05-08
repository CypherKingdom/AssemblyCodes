; Check if number is even or odd using LSR
; Note: LSR shifts the number to the right and stores the last shifted bit in the carry flag
; LSR always inserts 0 from the left
        
        org     $10000          ; Program starts at address $10000
        
        lea     prompt1,A0      ; Load effective address of prompt1 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display string pointed by A0
        
        trap    #15             ; Call system function
        dc.w    6               ; Get integer input into D0
        
        lsr     #1,D0           ; Logical shift right by 1 bit
        bcs     odd             ; Branch if carry set (odd number)
        
        lea     prompt2,A0      ; Load effective address of prompt2 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display "even" message
        bra     fin             ; Branch to end
        
odd     lea     prompt3,A0      ; Load effective address of prompt3 into A0
        trap    #15             ; Call system function
        dc.w    7               ; Display "odd" message
        
fin     trap    #15             ; Exit program
        dc.w    0               ; Exit code
        
        org     $11000          ; Data section starts at address $11000
prompt1 dc.b    "please enter an integer: ",0  ; Null-terminated string
prompt2 dc.b    "the integer is even",0        ; Null-terminated string
prompt3 dc.b    "the integer is odd",0         ; Null-terminated string