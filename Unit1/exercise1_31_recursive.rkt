#lang scheme
(define (product a b term next)
  (if (> a b)
  1
  (* (term a) (product (next a) b term next)))
)


(define (next-number x) (+ x 2))
(define (EveryNumber x)
  (/ (* (- x 1) (+ x 1)) (* x x)))
(define (pai x)
  (* 4 (product 3 x EveryNumber next-number)))
(pai 500)






;;;;;;;;;;;;;;;;;;;;;;;;;;;; this is for factorial
#|
(define (identity x) x)
(define (AddOne x) (+ x 1))

(define (factorial n)
  (product 1 n identity AddOne))

(factorial 5)
|#