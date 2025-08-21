#lang scheme
; the firt method
#|
(define (square-list items)
  (if (null? items)
      null
      (cons ((lambda (x) (* x x)) (car items))
            (square-list (cdr items)))))
|#

; the second method
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))
(define (square-list items)
  (map (lambda (x) (* x x)) items))
(square-list (list 1 2 3 4 5))
