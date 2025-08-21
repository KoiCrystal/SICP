#lang scheme
(define (cont-frac n d k)
  (define (k-term-cont-frac n d i result)
    (if (= i 0)
        result
        (k-term-cont-frac n d (- i 1) (/ (n i) (+ (d i) result)))))
  (k-term-cont-frac n d k 0))

(define (d-function i)
  (if (= 2 (remainder i 3))
      (* 2 (+ 1 (truncate (/ i 3))))
      1))
(+ 2 (cont-frac (lambda (i) 1.0)
           d-function
           11))
