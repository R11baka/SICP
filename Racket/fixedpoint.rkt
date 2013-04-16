(define tolerance 0.001)
;average
(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
(lambda (x) (average x (f x))))
; fixed point
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))  
  (define (try guess)
    (let ((next (f guess)))
      (display  guess)
      ( newline)
      (if (close-enough? guess next)
          next
          (try next)
          )))
  (try first-guess))

;(fixed-point cos 1.0)
;1.35
;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 0.0002)
;(fixed-point  
 ;  ( lambda (x) (average x (/ (log 1000) (log x)))) 
  ;  2.0)
(define dx 0.0001)
(define (cube x) (* x x x))
;deriv
(define (deriv g) 
         (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define (newton-transform g)
(lambda (x)
(- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
(fixed-point (newton-transform g) guess))


