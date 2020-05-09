#lang racket
(#%require sicp-pict)
(define xp
  (segments->painter (
                     list
                     (make-segment (make-vect 0 0) (make-vect 1 1))
                     (make-segment (make-vect 0 1) (make-vect 1 0))
                     )))
(paint xp)

