#lang scheme
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) 
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))  ;I am so intelligent

(define (square x) (* x x))
((one square) 2)
((two square) 2)
(((add one two) square) 2)
