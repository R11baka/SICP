#lang sicp
;Exercise 1.41: Define a procedure double that takes a procedure of one
;argument as argument and returns a procedure that applies the original procedure twice.
;For example, if
;inc is a procedure that adds 1 to its argument,
;then (double inc) should be a procedure that adds 2. What value is returned by
;(((double (double double)) inc) 5)

(define (inc x) (+ 1 x))
(define (square x) (* x x))

(define (double f)
  (lambda (x)(f (f x))))

(((double (double double)) inc) 5)

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (lambda (x) ((repeated f (- n 1)) (f x)))       
  ))
((repeated square 2) 5)