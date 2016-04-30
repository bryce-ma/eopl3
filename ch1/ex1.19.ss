#lang scheme

;;exercise 1.19
(define (list-set lst n x)
  (if (zero? n) (cons x (cdr lst))
      (cons (car lst) (list-set (cdr lst) (- n 1) x))))

(list-set '(a b c d) 2 '(1 2))
