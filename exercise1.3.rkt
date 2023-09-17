#lang scheme
(define (square x) (* x x))
(define (sum_of_square a b) (+ (square a) (square b)))
(define (two_large a b c)
  (cond ((and (< a b) (< a c))(sum_of_square b c))
    ((and (< b a) (< b c)) (sum_of_square a c))
    ((and (< c a) (< c b)) (sum_of_square a b))
  ))

(two_large 5 4 6)