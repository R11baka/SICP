(define (close-enough? a b) 
  (< (abs(- a b)) 0.0001))
(define (average a b) (/ (+ a b) 2))
(define (positive? a) (> a 0))
(define (negative? a) (< a 0))
;midpoint
(define (half-interval function negpoint positivpoint)  
  (let 
      ((midpoint (average negpoint positivpoint)))
    (if (close-enough? negpoint positivpoint)
        midpoint
       (let ((test-point (function midpoint)))
         (cond ((positive? test-point) (half-interval function negpoint midpoint))
               (negative? test-point) (half-interval function midpoint positivpoint)
               (else midpoint)
               )     
                
       ))
))

; try
(define (double x) (* x x))
(half-interval (lambda(x) (- (* x x) 6)) 
               2.0 
               4.0)