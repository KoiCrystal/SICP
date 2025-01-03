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

(define (deep-reverse list)
  (define (deep-rev n)
    (if (= n 0)
        (if (pair? (car list))
            (cons (deep-reverse (car list)) null)
            (cons (car list) null))
        (if (pair? (list-ref list n))
            (cons (deep-reverse (list-ref list n)) (deep-rev (- n 1)))
            (cons (list-ref list n) (deep-rev (- n 1))))))
  (deep-rev (- (length list) 1)))


(define list1 (list (list 1 2) (list 3 4)))
(deep-reverse list1)
(define list2 (list 0 (list 1 2) (list 3 4 (list 5 6))))
(deep-reverse list2)
