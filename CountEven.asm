           org         $10000
           move.l      #10,D3          ;D3 is used as the loop counter
           clr.l       D4              ;D4 is used as the offset for the array address
loop1      lea         prompt1, A0
           trap        #15
           dc.w        7
           trap        #15
           dc.w        6
           lea         storage, A1
           add.l       D4, A1
           move.b      D0, (A1)
           add.l       #1, D4          ;incrementing my offset (1 because we used ds.b)
           sub.l       #1, D3          ;decrementing my elements counter
           bne         loop1

           move.l      #10, D3         ;D3 is used as the second loop counter
           clr.l       D4              ;D4 is used as the offset
           clr.l       D5              ;D5 is used as the even numbers counter
loop2      lea         storage, A1
           add.l       D4, A1
           clr.l       D2
           move.b      (A1), D2        ;fetching the element from the memory into D2
           cmp.l       #0, D2
           beq         inc
subt       sub.l       #2, D2
           bgt         subt
           blt         next
inc        add.l       #1,D5
next       add.l       #1, D4
           sub.l       #1,D3
           bne         loop2

           lea         prompt2, A0
           trap        #15
           dc.w        7
           move.l      D5, D0
           trap        #15
           dc.w        5

           trap        #15
           dc.w        0

           org         $11000
prompt1    dc.b        "Please enter an integer (<255): ",0
prompt2    dc.b        "The number of even elements is: ",0
storage    ds.b        10