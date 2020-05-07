#lang sicp
; sicp 1.2

(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))


(define (fact-iter product counter max-counter)
  (if (> counter max-counter)
      product
      (fact-iter (* product counter) (+ 1 counter) max-counter)))

(define (fact-i n)
  (fact-iter 1 1 n))


(fact-i 10)
(fact 10)
