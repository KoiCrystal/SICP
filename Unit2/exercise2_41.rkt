#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; use <proc> to every item in seq, and return a list
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence)) (cons (car sequence)
                                          (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; generate sequence from low to high
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-triples-pairs n)
        (flatmap (lambda (i)
                         (flatmap (lambda (j)
                                      (map (lambda (k)
                                                   (list i j k))
                                           (enumerate-interval 1 (- j 1))))
                              (enumerate-interval 1 (- i 1))       
                              ))
                 (enumerate-interval 1 n)))

(unique-triples-pairs 4)

(define (triples n s)

        (define (sum-equal-s? x) 
                (= s (+ (car x) (car (cdr x)) (car (cdr (cdr x))))))

        (filter sum-equal-s?
                (unique-triples-pairs n)))
(triples 6 10)
