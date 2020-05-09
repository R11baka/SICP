#lang racket
;Exercise 2.17: Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:
;
;(last-pair (list 23 72 149 34))
(define (last-pair l)
  (if (null? (cdr l))
             l
             (last-pair (cdr l))))
(last-pair (list 23 72 149 34))

;Exercise 2.18: Define a procedure reverse that takes a list as argument and
;returns a list of the same elements in reverse order:
;(reverse (list 1 4 9 16 25))
;(25 16 9 4 1)
(define (reverse l)
  (if (null? (cdr l))
      l
      (append (reverse (cdr l)) (list (car l)))))
(reverse (list 1 4 9))

