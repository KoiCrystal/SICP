#lang scheme


; directly

(define (proc-tree tree proc) (if (null? tree)
                                null
                                (if (pair? tree)
                                    (cons (square-tree (car tree)) (square-tree (cdr tree)))
                                    (proc tree)))
                            )


; map and recursion
#|
(define (proc-tree tree proc) (map (lambda (sub-tree)
                                        (
                                         if (pair? sub-tree)
                                            (square-tree sub-tree)
                                            (proc sub-tree)
                                        )
                                )
                                tree
                           )
)
|#

(define (tree-map proc item)
        (proc-tree item proc))

(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))


