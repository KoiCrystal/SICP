#lang scheme
(define (product a b term next)
  (define (iter j result)
        (if (> j b)
             result
             (iter (next j) (* result (term j)))))
  (iter a 1))

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