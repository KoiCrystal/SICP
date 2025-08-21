#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))


(define my-list-1 (list 1 2 3 4 5))
(define my-list-2 (list 6 7 8))

(map (lambda (x) (* x x)) my-list-1)
(append my-list-1 my-list-2)
(length my-list-1)