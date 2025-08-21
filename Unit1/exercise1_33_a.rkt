#lang scheme
(define(filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (small-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divisor? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divisor? test-divisor n)
  (= (remainder n test-divisor) 0))
(define (square x) (* x x))
(define (prime? n)    ;this process think 1 is a prime
  (= n (small-divisor n)))

(define (inc x) (+ x 1))
(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-square-prime 2 10)