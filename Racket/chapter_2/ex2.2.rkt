#lang racket
;Exercise 2.2: Consider the problem of representing line segments in a plane.
;Each segment is represented as a pair of points: a starting point and an ending point.
;Define a constructor make-segment and selectors start-segment and end-segment that
;define the representation of segments in terms of points. Furthermore, a point can be represented as a
;pair of numbers: the x coordinate and the y coordinate.
;Accordingly, specify a constructor make-point and selectors x-point and y-point that define this representation.
;Finally, using your selectors and constructors,
;define a procedure midpoint-segment that takes a line segment as argument and returns its midpoint
;(the point whose coordinates are the average of the coordinates of the endpoints). To try your procedures, you’ll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point xpoint ypoint)
  (cons xpoint ypoint))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-segment start-p end-p)
  (cons start-p end-p))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (mid-point seg)
  (let (
        (xstart (x-point (start-segment seg)))
        (ystart (y-point (start-segment seg)))
        (xend (x-point (end-segment seg)))
        (yend (y-point (end-segment seg)))
        )
    (make-point (+ xstart (/ (- xend xstart) 2))
                (+ ystart (/ (- yend ystart) 2))
                )))

(define x (make-point 3 4))
(define y (make-point 5 8))
(define s (make-segment x y))
(mid-point s)

;; EXERCISE 2.4

(define (cons1 x y)
  (lambda (m) (m x y)))

(define (car1 z)
  (z (lambda (p q) p)))

(define (cdr1 z)
  (z (lambda (p q) q)))

(define z1 (cons1 2 3))
(car1 z1)
(cdr1 z1)