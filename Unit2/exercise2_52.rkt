#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1))) 

;;; a
; skip here, can be changed in other exercises by draw-line 

;;; b
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
        (if (= n 0) painter
                    (
                        let ((smaller (up-split painter (- n 1))))
                            (below painter (beside smaller smaller))
                    )
        )
)

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside (beside up up) (beside up up)))
              (bottom-right (below (below right right) (below right right)))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split einstein 3))

;;; c
(define (square-limit painter n)
  (let ((quarter (corner-split (flip-horiz painter) n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(paint (square-limit einstein 3))
