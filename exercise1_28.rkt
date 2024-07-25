#lang scheme
(define (square x)
  (* x x))

#|
; use expmod many times, maybe I should use an argument to save the rusult of expmod recursion
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (if (and (= (remainder (square (expmod base (/ exp 2) m)) m) 1)
                              (not (= (expmod base (/ exp 2) m) 1))
                              (not (= (expmod base (/ exp 2) m) (- m 1))))
                         0
                         (remainder (square (expmod base (/ exp 2) m)) m)
                      ))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))
|#
(define (nontrivial-square-root expmod-result m)
  (if (and (= (remainder (square expmod-result) m) 1)
           (not (= expmod-result 1))
           (not (= expmod-result (- m 1))))
      0
      (remainder (square expmod-result) m)
  )
)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (nontrivial-square-root  (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times n) true)
  ((fermat-test n) (fast-prime? n (+ times 1)))
  (else false)))

(fast-prime? 6601 1)
