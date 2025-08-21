#lang scheme
(define (double x) (+ x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-* a b)
  (if (= b 0)
      0
      (if (even? b)
          (double (fast-* a (/ b 2)))
          (+ a (fast-* a (- b 1))))))

(fast-* 6 9)