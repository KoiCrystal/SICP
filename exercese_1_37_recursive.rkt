#lang scheme
(define (cont-frac n d k)
  (define (k-term-cont-frac n d i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (k-term-cont-frac n d (+ i 1))))))
  (k-term-cont-frac n d 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)