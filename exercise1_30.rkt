#lang scheme
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))
        ))
  (iter a 0))
;;;;;;;;;;;;;;;;;;;;;;;;;; there is a test under

(define (self x) x)
(define (next x) (+ x 1))
(sum self 1 next 10)