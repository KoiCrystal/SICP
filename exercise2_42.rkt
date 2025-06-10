#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define empty-board null)

(define (diagonal-check? k new-queen old-queen)
        (if (= k 0) #f
            (if (or (and (= (- (car new-queen) k) (car old-queen)) (= (- (car (cdr new-queen)) k) (car (cdr old-queen))))
                    (and (= (+ (car new-queen) k) (car old-queen)) (= (- (car (cdr new-queen)) k) (car (cdr old-queen)))))
                #t
                (diagonal-check? (- k 1) new-queen old-queen))))

(define (safe? k positions)
        (if (null? (cdr positions)) #t
            (if (= (car (car positions)) (car (car (cdr positions)))) #f
                (if (diagonal-check? (- k 1) (car positions) (car (cdr positions))) #f
                    (safe? k (append (list (car positions)) (cdr (cdr positions)))))
                )))

(define (adjoin-position new-row k rest-of-queens)
        (append (list (list new-row k)) rest-of-queens))

; rest-of-queens is a way to place k - 1 queens in the first k - 1 columns
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0) (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                                 (map (lambda (new-row)
                                              (adjoin-position new-row k rest-of-queens))
                                      (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)
(newline)
(queens 8)
