#lang racket
(#%require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))


; frames
(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2)
)

(define (origin-frame f)
	(car f)
)

(define (edge1-frame f)
	(car (cdr f))
)

(define (edge2-frame f)
	(car (cdr (cdr f)))
)
; vect
(define (make-vect x y)
  (cons x y))
(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cdr vect))
(define (add-vect v1 v2)
  (make-vect
   (+ (xcor-vect v1) (xcor-vect v2))
   (+ (ycor-vect v1) (ycor-vect v2))
   ))
(define (sub-vect v1 v2)
  (make-vect
   (- (xcor-vect v1) (xcor-vect v2))
   (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v1 s)
  (make-vect
   (* s (xcor-vect v1))
   (* s (ycor-vect v1))))
;segments
(define (make-segment start end)
  (cons start end))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (frame-coord-map frame)
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect
				(scale-vect (edge1-frame frame) (xcor-vect v))
				(scale-vect (edge2-frame frame) (ycor-vect v))
			)
		)
	)
)

(define (segments->painter-local segment-list)
	(lambda (frame)
		(segments->painter
			(map
				(lambda (segment)
					(make-segment
						((frame-coord-map frame) (start-segment segment))
						((frame-coord-map frame) (end-segment segment))
					)
				)
				segment-list
			)
		)
	)
)

(define xpainter
  (segments->painter-local (
                           list
                           (make-segment (make-vect 0 0) (make-vect 1 1))
                           (make-segment (make-vect 0 1) (make-vect 1 0))
                            (make-segment (make-vect 0.2 0.5) (make-vect 0.5 0.5))
                           )))

(define tpainter
  (segments->painter-local (
                          list
                          (make-segment (make-vect 0 0) (make-vect 0 1))
                          (make-segment (make-vect 0 1) (make-vect 1 1))
                          (make-segment (make-vect 1 1) (make-vect 1 0))
                            (make-segment (make-vect 1 0) (make-vect 0 0))
                          )))

(define f1 (make-frame (make-vect 0 0) (make-vect 0.99 0) (make-vect 0 0.99)))
(define midpoint
  (segments->painter-local (
                            list
                            (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
                            (make-segment (make-vect 1 0.5) (make-vect 0.5 0))
                            (make-segment (make-vect 0.5 0) (make-vect 0 0.5))
                            )))
(define (transform-painter 
         painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame new-origin
                  (sub-vect (m corner1) 
                            new-origin)
                  (sub-vect (m corner2)
                            new-origin)))))))
(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1)
                     (make-vect 0.0 0.0)))

(define (flip-vert painter)
  (transform-painter 
   painter
   (make-vect 0.0 1.0)   ; new origin
   (make-vect 1.0 1.0)   ; new end of edge1
   (make-vect 0.0 0.0))) ; new end of edge2

(paint ((rotate90 xpainter) f1))

(paint (xpainter f1))