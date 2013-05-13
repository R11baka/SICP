(load "common.rkt")
 ; start triples
 (define (unique-triples n) 
   (flatmap
    (lambda (k)
    (flatmap (lambda (i)     
      (map (lambda (j) (list k  i j))
           (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 (- k 1))))
              (enumerate-interval 1 n)))
 
 
;(display (unique-triples 5))
(define (triplets s n)
   (define (filter-sum?  triple)(= s (accumulate + 0 triple)))
  (filter filter-sum?  (unique-triples n)))
(display (triplets 12 12))
