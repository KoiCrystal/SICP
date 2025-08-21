#lang scheme
(define (make-interval x y)
  (cons x y))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (/ (/ (- (upper-bound i) (lower-bound i)) (center i)) 2))

; accurate method
;[a1 c1 b1] with t1, a1 = c1-c1*t1, b1 = c1+c1*t1
;[a2 c2 b2] with t2, a2 = c2-c2*t2, b2 = c2+c2*t2
; a1a2 = c1c2 - c1c2t1 - c1c2t2 + c1c2t1t2
; b1b2 = c1c2 + c1c2t1 + c1c2t2 + c1c2t1t2
; new_center = (a1a2+b1b2) / 2 = c1c2 + c1c2t1t2
; new_percent = (c1c2t1+c1c2t2) / (c1c2 + c1c2t1t2)
(define (mul-center-percent cp1 cp2)
  (make-center-percent (+ (* (center cp1) (center cp2)) (* (center cp1) (center cp2) (percent cp1) (percent cp2)))
                       (/ (* (center cp1) (center cp2) (+ (percent cp1) (percent cp2)))
                          (+ (* (center cp1) (center cp2)) (* (center cp1) (center cp2) (percent cp1) (percent cp2))))))


; approximate method
#|
(define (mul-center-percent cp1 cp2)
  (make-center-percent (* (center cp1) (center cp2)) (+ (percent cp1) (percent cp2))))
|#

(define cp1 (make-center-percent 10 0.005))
(define cp2 (make-center-percent 10 0.004))
(define cp3 (mul-center-percent cp1 cp2))
(center cp3)
(percent cp3)
