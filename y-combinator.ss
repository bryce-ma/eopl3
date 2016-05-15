#lang scheme

(define fact
  (lambda (x)
    (if (= 0 x) 1 (* x (fact (- x 1))))))

(define fact0
  ((lambda (u) (u u))
   (lambda (self)
     (lambda (x)
       (if (= 0 x) 1 (* x ((self self) (- x 1))))))))

;; 1*2*3*4 = 24
(fact 4)
(fact0  4)