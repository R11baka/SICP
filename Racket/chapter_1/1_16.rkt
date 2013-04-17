(define (even? n)
  (= (remainder n 2) 0)
  )
(define (square x) (* x x))
; bn = (bn/2 )2
;bn = b · bn−1
;если n четно
;если n нечетно
(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))        
        )
  )
;
; simple
(define (simple-exp b n)
  (if (= n 0) 1
      (* b (simple-exp b (- n 1)))    
))
;(iter-fast-exp 2 100000000000)
;(simple-exp 2 100000000000)

(define (inter-square-exp b n)
  (cond ((= n 1) b)
         ((even? n) (inter-square-exp (square b) (/ n 2) ))
        (else (* b (inter-square-exp b (- n 1))))
  )
)