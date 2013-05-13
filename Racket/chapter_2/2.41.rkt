(define nil '())   
 (define (filter predicate sequence) 
   (cond ((null? sequence) nil) 
         ((predicate (car sequence)) 
          (cons (car sequence)  
                (filter predicate (cdr sequence)))) 
         (else (filter predicate (cdr sequence))))) 
   (define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 
   (define (enumerate-interval low high) 
   (if (> low high) 
       nil 
       (cons low (enumerate-interval (+ low 1) high)))) 
  
 (define (flatmap proc seq) 
   (accumulate append nil (map proc seq)))
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