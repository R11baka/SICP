(define (inc a)(+ a 1))
(define (dec a) (- a 1))

(define (plus a b)
  (
   if(= a 0) b
     (inc(plus (dec a) b))
  )
 )
; iterat recirsion
(define (plus1 a b)(
  if(= a 0) b
  (plus (dec a) (inc b))
))

(plus 4 5)
(plus1 4 5)