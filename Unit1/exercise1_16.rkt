#lang scheme
(define (even? x)
  (= (remainder x 2) 0))

#|
for example, b^10 = (b^2)^5 = (b^2)^4 * (b^2)
the part (b^2)^4 will go into next iteration
but the remain part *(b^2) will make the process to be recursion,
it will wait for the result of (b^2)^4
so we use 'a' to save the "odd part" in several state that n is odd.
|#


(define (fast-expt-iter b n a)
  (if (= n 1)
     (* a b)
     (if (even? n)
         (fast-expt-iter (* b b) (/ n 2) a)
         (fast-expt-iter b (- n 1) (* a b)))))

(fast-expt-iter 2 11 1)