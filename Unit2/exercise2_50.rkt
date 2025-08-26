;;; the definations in book is different as in sicp-pict
;;; so if you want to see the picture and don't want to write basic draw function
;;; use the sicp-pict package directly
#lang racket
(require sicp-pict)

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)   
                     (make-vect 0 0)   
                     (make-vect 1 1))) 

(define line-triangel
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 0))
         (make-segment (make-vect 0 0) (make-vect 0.5 0.5))
         (make-segment (make-vect 0.5 0.5) (make-vect 1 0))
         (make-segment (make-vect 0 0) (make-vect 0 1)))))

(define (rotate-counterclock-180 painter)
    (transform-painter painter
                       (make-vect 1 1)
                       (make-vect 0 1)
                       (make-vect 1 0)))

(define (rotate-counterclock-270 painter)
    (transform-painter painter
                       (make-vect 0 1)
                       (make-vect 0 0)
                       (make-vect 1 1)))
(paint  line-triangel)
(paint (flip-horiz line-triangel))
(paint (rotate-counterclock-180 line-triangel))
(paint (rotate-counterclock-270 line-triangel))
