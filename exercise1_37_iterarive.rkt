#lang scheme
(define (cont-frac n d k)
  (define (k-term-cont-frac n d i result)
    (if (= i 0)
        result
        (k-term-cont-frac n d (- i 1) (/ (n i) (+ (d i) result)))))
  (k-term-cont-frac n d k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)