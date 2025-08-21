#lang scheme
(define (make-interval x y)
  (cons x y))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (/ (/ (- (upper-bound i) (lower-bound i)) (center i)) 2))

(define i1 (make-center-percent 100 0.1))
(percent i1)