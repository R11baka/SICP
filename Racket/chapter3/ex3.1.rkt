#lang sicp
(define (make-account balance password)
  (define (pass-proc proc)
  (lambda (p . a)
    (if (eq? p password) (apply proc a)
        (error "incorrect password"))))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (check-pass p m)(
                           (if (eq? p password)  (dispatch m)
                               (error "Incorrect password")
                               ))
    )
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: 
                 MAKE-ACCOUNT" m))))
  (pass-proc dispatch))

(define acc (make-account 100 '123))
((acc '123 'withdraw) 40)
;((acc '123 'withdraw) 40)
(define (make-accumulator init)
  (lambda (amount)
    (begin
      (set! init (+ init amount))
      init))
  )
(define A (make-accumulator 5))

(define (make-monitored proc)
  (define countCalls 0)
  (define (how-many-calls?) (countCalls))
  (define (appl  arg) (proc arg))
  (define (dispatch m)
    (cond ((eq? m 'how-many-calls?) countCalls)
          (else
           (begin
             (set! countCalls (+ 1 countCalls))
             (proc m)
             )
           )))
  dispatch)


(define s (make-monitored sqrt))

(define (pass-proc proc pass)
  (lambda (p . a)
    (if (eq? p pass) (apply proc a)
        (error "incorrect password"))))


