#lang scheme
; d  only need to change selectors
#|
(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cdr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cdr branch))
|#


; a

(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))


; b
(define (total-weight mobile)
  (define (get-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))
  (+ (get-weight (left-branch mobile)) (get-weight  (right-branch mobile))))

; c
(define (balanced? mobile)
  (define (torque branch)
    (if (pair? (branch-structure branch))
        (* (branch-length branch) (total-weight (branch-structure branch)))
        (* (branch-length branch) (branch-structure branch))))
  (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
       (if (pair? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           #t)
       (if (pair? (branch-structure (right-branch mobile)))
           (balanced? (branch-structure (right-branch mobile)))
           #t)))



; test data
(define b1 (make-branch 1 2))
(define b2 (make-branch 3 4))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 5 6))
(define b4 (make-branch 7 m1))
(define m2 (make-mobile b3 b4))

; test of a

(left-branch m1)
(right-branch m1)
(branch-length b1)
(branch-structure b1)
(branch-structure b4)


; test of b
(total-weight m1)
(total-weight m2)

; test of c
#|
              *
       
       (4,6)     (2, *)
                
                (5,8) (10,4)
|#
; m3 is a balanced sub-mobile
(define b5 (make-branch 4 6))
(define b6 (make-branch 5 8))
(define b7 (make-branch 10 4))
(define m3 (make-mobile b6 b7))
; m4 is a balanced mobile
(define b8 (make-branch 2 m3))
(define m4 (make-mobile b5 b8))
; sub-mobile dont balanced test
(define b9 (make-branch 6 8))
(define b10 (make-branch 9 4))
(define m5 (make-mobile b9 b10))
(define b11 (make-branch 2 m5))
(define m6 (make-mobile b5 b11))

(balanced? m1)
(balanced? m2)
(balanced? m3)
(balanced? m4)
(balanced? m6)
