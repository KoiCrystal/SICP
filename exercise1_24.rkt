#lang sicp
(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  
  (define (try-it a)
    (= (expmod a n n) a))

  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
  ((fermat-test n) (fast-prime? n (- times 1)))
  (else false)))


(define (timed-prime-test n amount)
  (newline)
  (display n)
  (start-prime-test n (runtime) amount))

(define (start-prime-test n start-time amount)
  (if (fast-prime? n 5)
      (report-prime (- (runtime) start-time) n amount)
      (timed-prime-test (+ n 1) amount)))

(define (report-prime elapsed-time n amount)
  (display "***")
  (display elapsed-time)
  (if (> amount 0)
      (timed-prime-test (+ n 1) (- amount 1))))
  
(timed-prime-test 10 2)