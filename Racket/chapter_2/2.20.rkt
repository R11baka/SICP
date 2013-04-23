(define (even? n)
  (= (remainder n 2) 0))
(define (rem n) (remainder n 2))

(define (length items) 
  (if (null? items)
      0
      (+ 1 (length (cdr items ))))
  )

(define (same-parity x . w)
  (define (same x listarg)
    (let ((rm (rem x)))
      ( cond ((null? listarg) (list nil))            
             ((= rm (rem (car listarg))) (cons (car listarg) (same x (cdr listarg))  ))
             (else  (same x (cdr listarg)))
       )                    
      )
   )
  (list x (same x  w))
)

(same-parity 1 2 3 5 4)
(same-parity 1 )
(same-parity 2 3 4 5 6)