;1.41
(define (inc x)(+ x 1))
(define (square x) (* x x))
(define (double function)
  (lambda (x)(function (function x))))

;((double inc) 1)
;(((double (double double)) inc) 5)
;1.42
(define (compose f g) (lambda (x) (f (g x))))
;((compose square inc) 6)
;1.43
(define (repeated f n)
  (if (= n 1) 
      (lambda (x) (f x))
       (compose f (repeated f (- n 1)))
      ))
((repeated square 2) 5)