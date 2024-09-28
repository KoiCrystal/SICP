#lang scheme
(define (iterative-improvement good-enough-guess? improve-guess)
  (lambda (guess)
    (if (good-enough-guess? guess)
        guess
        ((iterative-improvement good-enough-guess? improve-guess) (improve-guess guess)))
    )
  )
;both iterative-improvement is right
#|
(define (iterative-improvement good-enough-guess? improve-guess)
  (lambda (guess)
    (define (try guess)
      (if (good-enough-guess? guess)
          guess
          (try (improve-guess guess))))
    (try guess) 
))
|#

; this is for sqrt
(define (average x y)
  (/ (+ x y) 2))
(define (square x first-guess)
  (define (square x) (* x x))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improvement good-enough? improve) first-guess))
(square 4 1)



; this is for fixed-point
#|
(define tolerance 0.00001)
(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)))
(define (fixed-point f first-guess)
  (define (close-enough? x)
    (< (abs (- x (f x))) tolerance))
  ((iterative-improvement close-enough? (average-damp f)) first-guess))
(fixed-point cos 1)
|#



  
