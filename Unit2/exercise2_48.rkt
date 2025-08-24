#lang scheme

(define (make-vect x y)
    (cons x y))

(define (make-segment v1 v2)
    (list v1 v2))
(define (start-segment s)
    (cdr (car s)))
(define (end-segment s)
    (cdr (car (cdr s))))

(define v1 (make-vect 0 3))
(define v2 (make-vect 1 7))
(define s (make-segment v1 v2))
(start-segment s)
(end-segment s)
