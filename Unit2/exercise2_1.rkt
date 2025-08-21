#lang scheme
(define (make-rat n d)
  (cond ((and (> n 0) (> d 0)) (cons n d))
        ((and (> n 0) (< d 0)) (cons (- n) (- d)))
        ((and (< n 0) (> d 0)) (cons n d))
        ((and (< n 0) (< d 0)) (cons (- n) (- d)))))

(make-rat 3 5)
(make-rat 3 -5)
(make-rat -3 5)
(make-rat -3 -5)