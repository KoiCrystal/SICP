#lang scheme
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (for-each proc items)
  (if (= 1 (length items))
      (proc (car items))
      (begin (proc (car items)) (for-each proc (cdr items)))))    ; use "begin" to execute several command




(for-each (lambda (x) (display x) (newline))
          (list 1 2 3 4))


(for-each (lambda (x)  (display (= x 3)) (newline))
          (list 1 2 3 4))