#lang scheme
(define (cont-frac n d k)
  (define (k-term-cont-frac n d i result)
    (if (= i 0)
        result
        (k-term-cont-frac n d (- i 1) (/ (n i) (- (d i) result)))))
  (k-term-cont-frac n d k 0))


(define (tan-cf x k)
  (define (n-function i)
    (if (= i 1)
        x
        (* x x)))
  (cont-frac n-function
             (lambda (i) (+ 1 (* (- i 1) 2)))
             k))

(tan-cf (/ 3.14159265358979323846 4) 11)