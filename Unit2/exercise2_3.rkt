#lang scheme
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x-coordinate y-coordinate)
  (cons x-coordinate y-coordinate))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))


(define (len-line s) (+ (abs (- (x-point (start-segment s)) (x-point (end-segment s))))
                        (abs (- (y-point (start-segment s)) (y-point (end-segment s))))))

; first representation
#|
(define (make-horizonal-lines s1 s2)
  (cons s1 s2))
(define (make-vertical-lines s1 s2)
  (cons s1 s2))
(define (make-retangles h-lines v-lines)
  (cons h-lines v-lines))
(define (get-horizonal-line retangle) (car (cdr retangle)))
(define (get-vertical-line retangle) (car (car retangle)))
(define top-line (make-segment (make-point 3 4) (make-point 7 4)))
(define bottom-line (make-segment (make-point 3 2) (make-point 7 2)))
(define left-line (make-segment (make-point 3 2) (make-point 3 4)))
(define right-line (make-segment (make-point 7 2) (make-point 7 4)))
(define r1 (make-retangles (make-vertical-lines left-line right-line) (make-horizonal-lines top-line bottom-line)))
(define (get-width r)
  (len-line (get-horizonal-line r)))
(define (get-high r)
  (len-line (get-vertical-line r)))
|#

; second representaion

(define (make-lengths width high)
  (cons width high))
(define (make-retangles start-point lengths)  ;the retangle will be in the right-top of the start point
  (cons start-point lengths))
(define (get-width r)
  (car (cdr r)))
(define (get-high r)
  (cdr (cdr r)))
(define r1 (make-retangles (make-point 3 2) (make-lengths 2 4)))


(define (area-retangles r)
  (* (get-width r) (get-high r)))
(define (perimeter r)
  (* 2 (+ (get-width r) (get-high r))))
(area-retangles r1)
(perimeter r1)

