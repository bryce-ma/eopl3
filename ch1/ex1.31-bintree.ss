#lang scheme

;;exercise 1.31
(define leaf
  (lambda (x)
    x))

(define interior-node
  (lambda (node leaf1 leaf2)
    (list node leaf1 leaf2)))

(define (lson bintree)
  (cadr bintree))

(define (rson bintree)
  (caddr bintree))

(define (contents-of node)
  (if (list? node)
      (car node)
      node))

;;determine whether a bintree is a leaf
;; i.e. is a number or not
(define leaf?
  (lambda (bintree)
    (number? bintree)))

(provide leaf? contents-of lson rson leaf interior-node)