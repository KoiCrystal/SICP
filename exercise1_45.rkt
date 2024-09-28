#lang scheme
; expt from exercise1_16
(define (even? x)
  (= (remainder x 2) 0))
(define (fast-expt-iter b n a)
  (if (= n 1)
     (* a b)
     (if (even? n)
         (fast-expt-iter (* b b) (/ n 2) a)
         (fast-expt-iter b (- n 1) (* a b)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))
(define (repeated original-f n)
  (define (repeat-f f n)
      (if (= n 1)
      (lambda (x) (f x))
      (repeat-f (compose f original-f) (- n 1))))
  (repeat-f original-f n))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (if (close-enough? guess (f guess))
        (f guess)
        (try (f guess))))
  (try first-guess))


(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)))

;(define (n-th-root x times-average-damp n)
(define (n-th-root x n)
  ;(fixed-point (lambda (y) (/ (+ y (/ x y)) 2) ) 1.0)
  ;(fixed-point ((repeated average-damp times-average-damp) (lambda (y) (/ x y y y))) 1.0)
  (fixed-point ((repeated average-damp (floor (log n 2))) (lambda (y) (/ x (fast-expt-iter y (- n 1) 1)))) 1.0)
  )

;(n-th-root 25 4 16)
; I find that in n-th-root, times-average-admp must over log2(n)

(n-th-root 125 3)


