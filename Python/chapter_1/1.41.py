"""
1.41
(define (inc x)(+ x 1))
(define (square x) (* x x))
(define (double function)
  (lambda (x)(function (function x))))

((double inc) 1)
(((double (double double)) inc) 5)
;1.42
(define (compose f g) (lambda (x) (f (g x))))
((compose square inc) 6)
;1.43
(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
       (compose f (repeated f (- n 1)))
      ))
((repeated square 2) 5)
"""

def inc(x):
    return x + 1


def square(x):
    return x * x


def double(func):
    return lambda x: func(func(x))


def compose(f, g):
    return lambda x: f(g(x))


def repeat(f, n):
    if n == 1:
        return lambda x: f(x)
    else:
        return compose(f, repeat(f, (n - 1)))

print double(inc)(3)
#5
print compose(square, inc)(6)
#49
print repeat(square,2)(5)
#625
