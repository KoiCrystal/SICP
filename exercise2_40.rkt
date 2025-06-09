#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence)) (cons (car sequence)
                                          (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; use <proc> to every item in seq, and return a list
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (square x) (* x x))
(define (small-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divisor? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divisor? test-divisor n)
  (= (remainder n test-divisor) 0))
(define (prime? n)
  (= n (small-divisor n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; generate sequence from low to high
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (permutations s)
  (if (null? s)                    ; empty set?
      (list null)                   ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (unique-pairs n)
        (flatmap (lambda (i)
                         (map (lambda (j)
                                      (list i j))
                              (enumerate-interval 1 (- i 1))       
                              ))
                 (enumerate-interval 1 n)))

(unique-pairs 3)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(prime-sum-pairs 6)
