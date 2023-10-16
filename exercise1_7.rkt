#lang scheme
(define (square x) (* x x))

#|
(define (good-enough? guess x)
  (<(abs (- (square guess) x)) 0.001))
|#


(define (new-good-enough? guess x)
  (and (> (/ (square guess) x) 0.999999999) (< (/ (square guess) x) 1.000000001)))

;(define (best-good-enough? guess x) ;the best solution in wiki, I think 
; (= (improve guess x) guess)) 

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 10000000000000)