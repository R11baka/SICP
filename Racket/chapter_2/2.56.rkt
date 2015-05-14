(load "common.rkt")
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
               (let ((coeff (make-product (exponent exp) (make-exponentiation (base exp) (- (exponent exp) 1)) )))
                 (make-product coeff (deriv (base exp) var))) 
               
        )
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
;
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

; sum
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) 
  (if (not (pair? (cdddr s))) 
      (caddr s)
      (cons '+ (cddr s))))
; multiply
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (if (not (pair? (cdddr p)))
      (caddr p)
      (cons '* (cddr p))))
;exponent
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '** )))
(define (make-exponentiation base exponent)
  (cond ((and (number? exponent) (=number? exponent 1)) base)
        (else (list '** base exponent))
        )
  )
(define (base s)(cadr s))
(define (exponent s) (caddr s))
(display (deriv '(* x y (+ x 3)) 'x))
;2.57