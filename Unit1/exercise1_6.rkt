#lang scheme
#|
we can see if only eval one clause
(if (= 1 2)
    (display "666")
    (display "777"))
|#

; new-if eval two clause
(define (display777)
  (display "777"))

(define (new-if predicate then-clause else-clause)
  (cond(predicate then-clause)
       (else else-clause)))
(new-if (= 1 1)
        (display "666")
        ;(display777)
        (display "777"))

