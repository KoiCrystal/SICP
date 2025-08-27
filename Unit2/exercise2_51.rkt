;;; the definations in book is different as in sicp-pict
;;; so if you want to see the picture and don't want to write basic draw function
;;; use the sicp-pict package directly
#lang racket
(require sicp-pict)

(define (my-flip-horiz painter)
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

;;; first method

; (define (below painter1 painter2)
;   (let ((split-point (make-vect 0.0 0.5)))
;     (let ((paint-down
;            (transform-painter painter1
;                               (make-vect 0.0 0.0)
;                               (make-vect 1.0 0.0)
;                               split-point))
;           (paint-up
;            (transform-painter painter2
;                               split-point
;                               (make-vect 1.0 0.5)    ; the edge1 end-point will sub orgin-point
;                               (make-vect 0.0 1.0))))
;       (lambda (frame)
;         (paint-down frame)
;         (paint-up frame)))))

;;; second method
(define (rotate-counterclock-270 painter)
    (transform-painter painter
                       (make-vect 0 1)
                       (make-vect 0 0)
                       (make-vect 1 1)))

(define (rotate-counterclock-90 painter)
    (transform-painter painter
                       (make-vect 1 0)
                       (make-vect 1 1)
                       (make-vect 0 0)))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2)
    (rotate-counterclock-270 (beside (rotate-counterclock-90 painter1) 
                                     (rotate-counterclock-90 painter2))))

(paint  line-triangel)
(paint (below line-triangel line-triangel))
