(define squares (list 1 4 9 16 25))

(define (length items) 
  (if (null? items)
      0
      (+ 1 (length (cdr items ))))
  )

(define (reverse items)
  (if (= (length items) 2)
      (cons (cdr items) (car items))
      (cons (reverse (cdr items)) (car items))
      )
)
(define l1 (list 1 4 3))
;(cdr l1)
(reverse l1)