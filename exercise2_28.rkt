#lang scheme
(define (fringe l)
  (if (not (pair? l))
      (if (not (null? l))
          (list l)
          null)
      (append (fringe (car l)) (fringe (cdr l)))))


(define x (list (list 1 2) (list 3 4)))
(fringe x)

(define y (list x x))
(fringe y)