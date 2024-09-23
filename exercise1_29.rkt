#lang scheme
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define (simpson-term x)
    (if (even? x)
        (* (/ (- b a) (* 3 n)) 2 (f (+ a (* x (/ (- b a) n)))))
        (* (/ (- b a) (* 3 n)) 4 (f (+ a (* x (/ (- b a) n))))))
  )
  (define (next x) (+ x 1))
  (+ (* (/ (- b a) (* 3 n)) (f a))
     (sum simpson-term 1 next (- n 1))
     (* (/ (- b a) (* 3 n)) (f b)))
)

(define (cube x) (* x x x))

(integral cube 0 1 1000)