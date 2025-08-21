#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(define v (list 1 2 3 4))
(define my-matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(matrix-*-vector my-matrix v)

(define (transpose mat)
  (accumulate-n cons null mat))
(transpose my-matrix)


(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))  ; n shoud be transposed because 'matrix-*-vector' is (3*4)*(1*4) 
    (map (lambda (x) (matrix-*-vector cols x)) m)))
(define my-matrix-2 (list (list 1 2 3) (list 3 4 5) (list 5 6 7) (list 7 8 9)))
(matrix-*-matrix my-matrix my-matrix-2)
