#lang scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum-integers a b)
  (accumulate + 0 identity a inc b))

(define (identity x) x)
(define (inc x) (+ x 1))

(sum-integers 1 10)


;;;;;;;;;;;;;;;;;;;;;;;;;;;; this is for factorial
#|
(define (product a b term next)
  (accumulate * 1 term a next b))

(define (identity x) x)
(define (AddOne x) (+ x 1))
(define (factorial n)
  (product 1 n identity AddOne))
(factorial 5)
|#