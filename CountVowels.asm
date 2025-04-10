           org         $10000
           lea         Prompt, A0
           trap        #15
           dc.w        7
           lea         prompt2, A0
           trap        #15
           dc.w        7
           lea         ourstr, A0
           trap        #15
           dc.w        8
           move.l      D0, D1          ;moving the size of my string to D1
           clr.l       D2              ;clearing D2 to be used as the counter
           lea         ourstr, A1
loop       move.b      (A1), D3
           adda        #1, A1
           cmp.b       #'a', D3
           beq         vowel
           cmp.b       #'e', D3
           beq         vowel
           cmp.b       #'o', D3
           beq         vowel
           cmp.b       #'u', D3
           beq         vowel
           cmp.b       #'i', D3
           beq         vowel
           cmp.b       #'y', D3
           beq         vowel
           sub.l       #1, D1
           bgt         loop
           bra         display

vowel      add.l       #1, D2
           sub.l       #1,D1
           bgt         loop

display    lea         prompt3, A0
           trap        #15
           dc.w        7
           move.l      D2, D0
           trap        #15
           dc.w        5


           trap        #15
           dc.w        0


           org         $11000
Prompt     dc.b        "Welcome to our first assembly program", $0A, $0D, 0
prompt2    dc.b        "Please enter a string (<=30 characters): ", 0
ourstr     ds.b        31
prompt3    dc.b        "The number of vowels is: ",0