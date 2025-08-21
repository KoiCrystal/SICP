#lang scheme

; add (car s) to every list in (subsets s)
(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))   
           (append rest (map (lambda (list) (cons (car s) list)) rest)) ; 'append' used to connect lists
      )
  )
)


(subsets (list 1 2 3))

#|
append (1 2) (3 4)  ->  (1 2 3 4)    
append  1  (3 4)  ->  (1 . 3 4)      
cons  1  (3 4)  ->  (1 3 4)
|#