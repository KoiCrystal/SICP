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

(define (square x) (* x x))
((repeated square 3) 5)