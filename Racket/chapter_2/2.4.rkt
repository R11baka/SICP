(define (cons x y)
(lambda (m) (m x y)))

(define (car z)
(z (lambda (p q) p)))
; my definition
; cdr z => lambda(m)(m x y) (lambda (p q) q)
; =>(lambda (p q) q) x y =>y
(define (cdr z)
(z (lambda (p q) q)))

(define z (cons 2 3))
(car z)
(cdr z)