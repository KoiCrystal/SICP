#lang scheme
(define (make-interval x y)
  (cons x y))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

