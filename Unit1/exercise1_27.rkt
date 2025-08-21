#lang sicp
(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n times)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it times))


(define (fast-prime? n times)
  (cond ((= times n) true)
  ((fermat-test n times) (fast-prime? n (+ times 1)))
  (else false)))

(fast-prime? 6601 1)
