 (define (sqrt-iter guess oldguess x)
   (
    if(good-enough? guess oldguess)
      guess
      (sqrt-iter (improve guess x) guess x)
    )
   )
 (define (improve guess x)
   (average guess (/ x guess )))
 
(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess oldguess)
;  (< (abs (- (square guess) x)) 0.001)
   ;(< (- 1 (/ oldguess (abs (- (square guess) x)))) 0.0001)
  (< (abs (/ (- guess oldguess) oldguess)) 0.0001)
  
  )

(define (square x) (* x x))
(define (sqrt x)(sqrt-iter 1.0 0.5 x ))

(sqrt 0.0009)
