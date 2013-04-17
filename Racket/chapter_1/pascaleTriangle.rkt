(define (calc-element row column)
  (
   cond ((= row column) 1)
        ((= column 1) 1)
        (else 
      (
       +
       (calc-element (- row 1) (- column 1))
       (calc-element (- row 1)  column )
      )
   )
   )
 )
(calc-element 4 2)