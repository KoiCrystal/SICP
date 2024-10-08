#lang scheme
(define (make-interval x y)
  (cons x y))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

