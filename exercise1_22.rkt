#lang sicp
(define (small-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divisor? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divisor? test-divisor n)
  (= (remainder n test-divisor) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (small-divisor n)))


(define (timed-prime-test n amount)
  (newline)
  (display n)
  (start-prime-test n (runtime) amount))

(define (start-prime-test n start-time amount)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n amount)
      (timed-prime-test (+ n 1) amount)))

(define (report-prime elapsed-time n amount)
  (display "***")
  (display elapsed-time)
  (if (> amount 0)
      (timed-prime-test (+ n 1) (- amount 1))))
  
(timed-prime-test 1000000 2)







;https://stackoverflow.com/questions/2195105/is-there-an-equivalent-to-lisps-runtime-primitive-in-scheme
;Open the Package Manager: in DrRacket choose the menu File then choose Package Manager....
;In the tab Do What I Mean find the text field and enter: sicp
;Finally click the Install button.

;#lang sicp
;(runtime)