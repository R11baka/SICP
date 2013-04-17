(define (product term a next b)
  (if (> a b) 1
      ( * (term a) (product term (next a) next b))
      )
  )

;factorial
(define (inc x) (+ x 1))
(define (identity x) x)
(define (fact n)
  (product identity 1 inc n)
 )
