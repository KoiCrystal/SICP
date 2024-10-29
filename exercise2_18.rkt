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

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define odds (list 1 3 5 7))
(define squares (list 4 9 16))

(define (reverse l)
  (define (rev n)
    (if (= n 0)
        (list (car l))
        (cons (list-ref l n) (rev (- n 1)))))
  (rev (- (length l) 1)))

(define list1 (list 25 16 9 4 1))
(reverse list1)
