#lang racket
(require racket/draw)

;; draw-line by chatgpt
(define bm (make-object bitmap% 120 120))
(define dc (new bitmap-dc% [bitmap bm]))
(send dc set-pen "black" 1 'solid)
(define (xcor p) (car p))
(define (ycor p) (cdr p))
(define (draw-line p1 p2)
  (send dc draw-line
        (xcor p1) (ycor p1)
        (xcor p2) (ycor p2)))


(define (make-vect x y)
    (cons x y))
(define (make-segment v1 v2)
    (list v1 v2))
(define (start-segment s)
    (car s))
(define (end-segment s)
    (car (cdr s)))

(define (xcor-vect vector)
    (car vector))
(define (ycor-vect vector)
    (cdr vector))

(define (add-vect v1 v2)
    (make-vect (+ (xcor-vect v1) (xcor-vect v2))
               (+ (ycor-vect v1) (ycor-vect v2))))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame frame)
    (car frame))
(define (edge1-frame frame)
    (car (cdr frame)))
(define (edge2-frame frame)
    (cdr (cdr frame)))

(define (scale-vect s v)
    (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define frame (make-frame (make-vect 0 0) (make-vect 100 0) (make-vect 0 100)))
; a
(define my-list-1 
    (list (make-segment (make-vect 0 0) (make-vect 0 1)) (make-segment (make-vect 0 0) (make-vect 1 0))
          (make-segment (make-vect 1 0) (make-vect 1 1)) (make-segment (make-vect 0 1) (make-vect 1 1))))
; b
(define my-list-2 
    (list (make-segment (make-vect 0 0) (make-vect 1 1)) (make-segment (make-vect 0 1) (make-vect 1 0))))
;c
(define my-list-3 
    (list (make-segment (make-vect 0 0.5) (make-vect 0.5 0)) (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
          (make-segment (make-vect 1 0.5) (make-vect 0.5 1)) (make-segment (make-vect 0.5 1) (make-vect 0 0.5))))
;d
(define my-list-4 
    (list (make-segment (make-vect 0 0.4) (make-vect 0.2 0.6)) (make-segment (make-vect 0.2 0.6) (make-vect 0.4 0.4))
          (make-segment (make-vect 0.4 0.4) (make-vect 0.6 0.6)) (make-segment (make-vect 0.6 0.6) (make-vect 0.8 0.4))
          (make-segment (make-vect 0.8 0.4) (make-vect 1 0.6))))

((segments->painter my-list-1)
    frame)

bm
