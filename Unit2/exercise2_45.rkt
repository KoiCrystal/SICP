#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1))) 
(define (split action1 action2)
    (
        lambda (painter n)
               (
                    if (= n 0) painter 
                       (
                            let ((smaller ((split action1 action2) painter (- n 1))))
                                (action1 painter (action2 smaller smaller))
                       )
               )
    )
)

(define right-split (split beside below))
(paint (right-split einstein 3)) 

(define up-split (split below beside))
(paint (up-split einstein 3)) 