#lang scheme
(define (make-interval x y)
  (cons x y))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

;the nine cases is:
; ++ ++ ++ -+ -+ -+ -- -- --
; ++ -+ -- ++ -+ -- ++ -+ --
;(-+ means spaning zero, include the cases that one of end-point is zero
; because zero-end-point don't affect combinations and permutations that yield maximum or minimum values)
;for example:
;(2,4) * (-1,3)   (2,4) * (0,3)
;the smallest is -1*4 , when 0 replaces -1, 0*4 is also the smallest in the new multiplication
;
;

(define (mul-interval x y)
  (cond ((and (> (lower-bound x) 0)
              (> (upper-bound x) 0)
              (> (lower-bound y) 0) 
              (> (upper-bound y) 0))
         (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
        ((and (> (lower-bound x) 0)
              (> (upper-bound x) 0)
              (<= (lower-bound y) 0) 
              (>= (upper-bound y) 0))
         (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
        ((and (> (lower-bound x) 0)
              (> (upper-bound x) 0)
              (< (lower-bound y) 0) 
              (< (upper-bound y) 0))
         (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y))))
        ((and (<= (lower-bound x) 0)
              (>= (upper-bound x) 0)
              (> (lower-bound y) 0) 
              (> (upper-bound y) 0))
         (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y))))
        
        ((and (<= (lower-bound x) 0)
              (>= (upper-bound x) 0)
              (<= (lower-bound y) 0) 
              (>= (upper-bound y) 0))
         (make-interval (if (< (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y)))
                            (* (lower-bound x) (upper-bound y))
                            (* (upper-bound x) (lower-bound y)))
                        (if (> (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))
                            (* (lower-bound x) (lower-bound y))
                            (* (upper-bound x) (upper-bound y)))))
        ((and (<= (lower-bound x) 0)
              (>= (upper-bound x) 0)
              (< (lower-bound y) 0) 
              (< (upper-bound y) 0))
         (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (lower-bound y))))
        ((and (< (lower-bound x) 0)
              (< (upper-bound x) 0)
              (> (lower-bound y) 0) 
              (> (upper-bound y) 0))
         (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))))
        ((and (< (lower-bound x) 0)
              (< (upper-bound x) 0)
              (<= (lower-bound y) 0) 
              (>= (upper-bound y) 0))
         (make-interval (* (lower-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
        ((and (< (lower-bound x) 0)
              (< (upper-bound x) 0)
              (< (lower-bound y) 0) 
              (< (upper-bound y) 0))
         (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
        
        ))


(define i1 (make-interval -3 4))
(define i2 (make-interval -6 1))
(mul-interval i1 i2)