#lang scheme

(define fact
  (lambda (x)
    (if (= 0 x) 1 (* x (fact (- x 1))))))

(define fact0
  ((lambda (u) (u u))
   (lambda (self)
     ((lambda (g)
        (lambda (x)
          (if (= 0 x) 1 (* x (g (- x 1)))))) (self self)))))

;; cannot terminate because of call-by-value, why?


;; 1*2*3*4 = 24
(fact 4)
(fact0  4)