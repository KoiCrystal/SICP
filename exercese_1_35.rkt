#lang scheme
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (if (close-enough? guess (f guess))
        (f guess)
        (try (f guess))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)