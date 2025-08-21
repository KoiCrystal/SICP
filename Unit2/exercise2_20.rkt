#lang scheme
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define (select-even l)
  (define (seleve ll)
    (if (null? ll)
        null
        (if (even? (car ll))
            (cons (car ll) (seleve (cdr ll)))
            (seleve (cdr ll)))))
  (if (null? l)
      null
      (seleve l))
  )

(define (select-odd l)
  (define (selodd ll)
    (if (null? ll)
        null
        (if (even? (car ll))
            (selodd (cdr ll))
            (cons (car ll) (selodd (cdr ll))))))
  (if (null? l)
      null
      (selodd l)))


(define (same-parity x . xl)
  (if (even? x)
      (cons x (select-even xl))
      (cons x (select-odd xl))))

(same-parity 1 2 3 4 5 6 7 8 9 10)
(same-parity 1)
(same-parity 2 3 4 5 6 7 8 9 10)
(same-parity 2)
(same-parity 2 3)