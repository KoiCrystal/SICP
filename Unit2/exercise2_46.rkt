#lang scheme
(define (make-vect x y)
    (cons x y))

(define (xcor-vect vector)
    (car vector))

(define (ycor-vect vector)
    (cdr vector))

(define (add-vect v1 v2)
    (make-vect (+ (xcor-vect v1) (xcor-vect v2))
               (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
    (make-vect (- (xcor-vect v1) (xcor-vect v2))
               (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
    (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define v1 (make-vect 1 3))
(define v2 (make-vect 4 7))

(add-vect v1 v2)
(sub-vect v2 v1)
(scale-vect v2 3)
