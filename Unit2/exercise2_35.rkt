#lang scheme

; sequence is the list of num of leaves of every node
; sequence of ((1 2) 3 4) is (2 1 1)
; accumulate adds every number in sequence
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; lambda (sub-tree) caculates num of leaves of every node
; why (null? sub-tree) is needed in 2.2.2 but not here
; because the last node 'null' is neglected in 'map'
(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-tree) (cond ((not (pair? sub-tree)) 1)
                                                (else (count-leaves sub-tree)))) 
                        t)))
(define x (cons (list 1 2) (list 3 4)))
(define y (list x x))
(count-leaves x)
(count-leaves y)


