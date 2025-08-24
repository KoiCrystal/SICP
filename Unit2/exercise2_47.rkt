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

(define (scale-vect s v)
    (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

;;; the first defination
; (define (make-frame origin edge1 edge2)
;   (list origin edge1 edge2))

; (define (origin-frame frame)
;     (car frame))
; (define (edge1-frame frame)
;     (car (cdr frame)))
; (define (edge2-frame frame)
;     (car (cdr (cdr frame))))

;;; the second defination
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame frame)
    (car frame))
(define (edge1-frame frame)
    (car (cdr frame)))
(define (edge2-frame frame)
    (cdr (cdr frame)))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))


(define origin (make-vect 1 3))
(define edge1 (make-vect 2 5))
(define edge2 (make-vect 3 9))
(define frame (make-frame origin edge1 edge2))
(define v (make-vect 4 10))

((frame-coord-map frame) v)