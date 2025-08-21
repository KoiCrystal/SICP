#lang scheme
(define (accumulate combiner null-value term a next b)
  (define (iter j result)
    (if (> j b)
        result
        (iter (next j) (combiner result (term j))))) 
  (iter a null-value))

(define (sum a b term next)
  (accumulate + 0 term a next b))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (sum-integers a b)
  (sum a b identity inc))
(sum-integers 1 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; this is for factorial
#|
(define (product a b term next)
  (accumulate * 1 term a next b))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (product 1 n identity inc))

(factorial 5)
|#