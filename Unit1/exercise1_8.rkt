#lang scheme
(define (cube-root x)
  (cbrt-iter 1.0 x))

(define (cbrt-iter y x)
  (if (good-enough? y x)
      y
      (cbrt-iter (improve y x) x)))

(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? y x)
  (= (improve y x) y))

(cube-root 9)