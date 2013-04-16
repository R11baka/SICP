;1.17
(define (mutiply a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (even? n)
  (= (remainder n 2) 0))
(define (double a) (* a 2))
(define (half a) (/ a 2))
; iretation
(define (multiply-log a b)
  (cond 
       ((= b 0) 0)
       ((= b 1) a)
       ((even? b)(multiply-log (double a) (half b)))
       (else (+ a (multiply-log a (- b 1)) ))             
  )
)
(multiply-log 2 10)
(define (mp a b) 
  (
   cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (mp a (half b))  ) )
        (else (+ a (mp a (- b 1)) ))
  )
 )
