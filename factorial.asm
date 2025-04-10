           org         $10000
           lea         prompt1, A0
           trap        #15
           dc.w        7
           trap        #15
           dc.w        6
           move.l      #1, D1          ;Calculating the factorial in D1
loop       cmp.l       #0, D0
           beq         result
           mulu.l      D0, D1
           sub.l       #1, D0
           bra         loop


result     lea         prompt2, A0
           trap        #15
           dc.w        7
           move.l      D1, D0
           trap        #15
           dc.w        5

           trap        #15
           dc.w        0

           org         $11000
prompt1    dc.b        "Please enter an integer: ",0
prompt2    dc.b        "The factorial is: ",0