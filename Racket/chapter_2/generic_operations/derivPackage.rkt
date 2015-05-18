#lang planet neil/sicp

(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list(make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! global-array (put-helper (list op type) global-array)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) global-array))

(define global-array '())
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
(and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (=number? exp num)
(and (number? exp) (= exp num)))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product m1 m2) (list '* m1 m2))
(define (sum? x)
(and (pair? x) (eq? (car x) '+)))
(define (product? x)(eq? (car x) '*))
(define (addend s) (cadr s))
(define (augend s) (caddr s))
(define (deriv exp var) (cond ((number? exp) 0)
((variable? exp) (if (same-variable? exp var) 1 0)) ((sum? exp)
(make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
(else (error "неизвестный тип выражения -- DERIV" exp))))

(define (operator exp) (car exp)) 
(define (operands exp) (cdr exp))

(define (deriv1 exp var)
   (cond ((number? exp) 0)
((variable? exp) (if (same-variable? exp var) 1 0)) (else ((get 'deriv (operator exp)) (operands exp)
var))))

(define (sum-deriv operands var)
    (make-sum
     (deriv1 (car operands) var)
     (deriv1 (cadr operands) var)
    ))
> 

> (define (install-sum-deriv)
     (define (sum-deriv operands var)
    (make-sum
     (deriv1 (car operands) var)
     (deriv1 (cadr operands) var)
    ))
   (define (sum-deriv1 operands var)
    (if (= (length operands) 2)
        (make-sum
         (deriv1 (car operands) var)
         (deriv1 (cadr operands) var)         
         )        
        (make-sum
         (deriv1 (car operands) var)
         (sum-deriv1 (cdr operands) var))
         ))
    
    (put 'deriv '+ sum-deriv1)    
    'done)
> (install-sum-deriv)

>
