#lang sicp
; sicp 1.7

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

;; solution
(define (sqrt-i x)
  (define (good-enough? guess oldguess)
    (< (abs (- 1 (/ guess oldguess) )) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess (improve guess))
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


(define (sqrt-lex x)
  (define (good-enough? guess oldguess x)
    (< (abs (- 1 (/ guess oldguess))) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess (improve guess x) x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(sqrt-lex 0.0000000025)
(sqrt 0.0000000025)
(sqrt-i 0.0000000025)