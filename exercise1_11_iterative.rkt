#lang scheme
(define (f n)
  (f-iter 2 1 0 n))


(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(f 7)