#lang scheme
(define (inc x) (+ x 1))
(define (double original-procedure)
  (lambda (x) (original-procedure (original-procedure x))))

(((double (double double)) inc) 5)