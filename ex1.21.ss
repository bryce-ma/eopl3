#lang scheme

(define (product sos1 sos2)
  (if (null? sos1)
       '()
       (union (product-one (car sos1) sos2)
             (product (cdr sos1) sos2))))

;;union two list's elements to one list
(define (union lst1 lst2)
  (append lst1 lst2))

;;product using one element and one list
(define (product-one e sos)
  (if (null? sos)
      '()
      (cons (cons e (car sos))
            (product-one e (cdr sos)))))

(product '(a b c) '(x y))