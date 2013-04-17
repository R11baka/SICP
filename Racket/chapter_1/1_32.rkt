;start defines
(define (plus a b) (+ a b))
(define (mul a b) (* a b))
(define (inc x) (+ x 1))
(define (identity x) x)
(define (product term a next b)
  (if (> a b) 1
      ( * (term a) (product term (next a) next b))
      )
  )

;factorial
(define (fact n)
  (product identity 1 inc n)
 )
;1.32

(define (accumulate combiner null-value term a next b)
  (
   if(> a b) null-value
     (combiner (term a) (accumulate combiner null-value term (next a) next b))
   )  
  )
;accumulate
(define (fac1 n)
  (accumulate mul 1  identity 1 inc 3)
  )
(fact 3)
(fac1 3)
(define (even? n)
  (= (remainder n 2) 1))

; filtered acumulate
(define (filtered-accumulate combiner null-value term a next b predicate?)
  (
   if(> a b) null-value
     (
      if(predicate? a)
            (combiner (term a) (filtered-accumulate combiner null-value term (next a)  next b predicate?))
            (filtered-accumulate combiner null-value term (next a)  next b predicate?)
             
      )   
   )
 )
(define (sum-odd a b)
  (filtered-accumulate plus 0 identity a inc b even? )
  )
(sum-odd 1 5)