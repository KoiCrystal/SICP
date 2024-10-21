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

(define (add-interval i1 i2)
  (make-interval (+ (lower-bound i1) (lower-bound i2))
                 (+ (upper-bound i1) (upper-bound i2))))

; whether I use accurate method or approximate method, the result is always different between par1 and par2
#|
(define (mul-interval cp1 cp2)
  (make-center-percent (* (center cp1) (center cp2)) (+ (percent cp1) (percent cp2))))
|#
(define (mul-interval cp1 cp2)
  (make-center-percent (+ (* (center cp1) (center cp2)) (* (center cp1) (center cp2) (percent cp1) (percent cp2)))
                       (/ (* (center cp1) (center cp2) (+ (percent cp1) (percent cp2)))
                          (+ (* (center cp1) (center cp2)) (* (center cp1) (center cp2) (percent cp1) (percent cp2))))))

(define (div-interval i1 i2)
  (mul-interval i1
                      (make-interval (/ 1.0 (upper-bound i2)) (/ 1.0 (lower-bound i2)))))
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


(define cp1 (make-center-percent 10 0.4))
(define cp2 (make-center-percent 10 0.5))

(div-interval cp2 cp2)   ; get the wrong answer 
(div-interval cp1 cp2)   ; get the right answer
(div-interval cp1 (add-interval cp1 cp2))  ; get the wrong answer, the answer calculated by paper and pen is alse wrong
#|
I can't prove r3=r1/(r1+r2) is wrong directly
but if r3 is right, 1/r3 is also will be right
but 1/r3 = (r1+r2)/r1 = r1/r1+r2/r1, r1/r1 will get the wrong answer, r2/r1 will get right answer
wrong + right = wrong
so r3 is wrong
|#

(newline)
(par1 cp1 cp2)  ; get the wrong answer by both computer and pen. because the mechanism is wrong
(par2 cp1 cp2)

