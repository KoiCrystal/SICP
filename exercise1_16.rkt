#lang scheme
(define (even? n)
  (= (remainder n 2) 0))


(define (fast-expt-iter b n a)
  (if (= n 1)
     (* a b)
     (if (even? n)
         (fast-expt-iter (* b b) (/ n 2) a)
         (fast-expt-iter b (- n 1) (* a b)))))

(fast-expt-iter 2 11 1)