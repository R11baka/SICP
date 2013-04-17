; 1.18
(define (even? n)
  (= (remainder n 2) 0))
(define (double a) (* a 2))
(define (half a) (/ a 2))

;
(define (fast-mp a b)
  (fast-mp-iter 0 1 a b)
  )
(define (fast-mp-iter acc counter a b)
  (
   cond ((= counter b) acc)
        ((< (double counter) b) (fast-mp-iter  (+ acc (double a)) (double counter) a b)  )
        (else (fast-mp-iter (+ acc a) (+ counter 1) a b))
   )
  )