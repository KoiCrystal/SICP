#lang scheme
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess steps)
    (newline)
    (display steps)
    (if (close-enough? guess (f guess))
        (f guess)
        (try (f guess ) (+ steps 1))))
  (try first-guess 0))

; without average damping
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)

;with average damping
(define (average x y)
  (/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)