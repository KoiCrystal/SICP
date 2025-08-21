#lang scheme
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x-coordinate y-coordinate)
  (cons x-coordinate y-coordinate))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (average x y) (/ (+ x y) 2))
(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s)) (x-point (end-segment s)))
             (average (y-point (start-segment s)) (y-point (end-segment s)))))
(define p1 (make-point -2 6))
(define p2 (make-point 1 5))
(define s1 (make-segment p1 p2))
(print-point (midpoint-segment s1))



