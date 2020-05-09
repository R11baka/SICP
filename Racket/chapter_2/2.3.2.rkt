#lang sicp
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product (exponent exp)
                        (make-exponentiation (base exp) (- (exponent exp) 1))
                       )
          (deriv (base exp) var))
         )
        (else
         (error "unknown expression type -- DERIV" exp))))

;; representing algebraic expressions

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (
    cond ((and (number? a1) (number? a2) ) (+ a1 a2))
         ((eq? a1 0) a2)
         ((eq? a2 0) a1)
         (else (list '+ a1 a2))
  ))

(define (make-product m1 m2)
   (cond ((and (number? m1) (number? m2) ) (* m1 m2))
         ((or (eq? m1 0) (eq? m2 0)) 0)
         ( (eq? m2 1) m1)
         ( (eq? m1 1) m2)
         (else (list '* m1 m2))
         )
  )

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))


 (deriv '(+ x 3) 'x)
 (deriv '(* x y) 'x)
 (deriv '(* (* x y) (+ x 3)) 'x)


;2.56
;Show how to extend the basic differentiator to handle more kinds of expressions. For instance, implement the differentiation rule
;d(un)dx=nun-1dudx
;by adding a new clause to the deriv program and defining appropriate procedures exponentiation?
;, base, exponent, and make-exponentiation.
;(You may use the symbol ** to denote exponentiation.)
;Build in the rules that anything raised to the power 0 is 1 and anything raised to the power 1 is the thing itself.
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**))
  )
(define (make-exponentiation base n)
  (cond ((eq? n 1) base)
        ((eq? n 0) 1)
        (else (list '** base n))
        ))
(define (base x)
  (cadr x))
(define (exponent x)
  (caddr x))

 (deriv '(** x 3) 'x)