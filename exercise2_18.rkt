#lang scheme
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define (last-pair l)
  (list-ref l (- (length l) 1)))



(define (reverse l)
  (define (rev n)
    (if (= n 0)
        (list (car l))
        (cons (list-ref l n) (rev (- n 1)))))
  (rev (- (length l) 1)))

(define list1 (list 25 16 9 4 1))
(reverse list1)
