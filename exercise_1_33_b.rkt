#lang scheme
(define(filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (product-gcd n)
  (define (gcd-filter x)
    (gcd x n))
  (filtered-accumulate * 1 identity 1 inc (- n 1) gcd-filter))

(product-gcd 7)