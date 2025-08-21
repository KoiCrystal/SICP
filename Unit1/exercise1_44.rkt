#lang scheme
(define (compose f g)
  (lambda (x)
    (f (g x))))
(define (repeated original-f n)
  (define (repeat-f f n)
      (if (= n 1)
      (lambda (x) (f x))
      (repeat-f (compose f original-f) (- n 1))))
  (repeat-f original-f n))

(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(define (square x) (* x x))
((n-fold-smooth square 3) 5)