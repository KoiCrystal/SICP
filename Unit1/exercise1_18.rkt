#lang scheme
(define (even? x)
  (= (remainder x 2) 0))

(define (fast-*-iter a b result)
  (if (= b 0)
      result
      (if (even? b)
          (fast-*-iter (* 2 a) (/ b 2) result)
          (fast-*-iter a (- b 1) (+ result a)))))

(fast-*-iter 7 19 0)