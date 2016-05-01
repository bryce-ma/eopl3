#lang scheme

(define leaf
  (lambda (x)
    x))

(define interior-node
  (lambda (node leaf1 leaf2)
    (list node leaf1 leaf2)))

;;building tree test
(interior-node 'bar
               (leaf 26)
               (leaf 12))

;;determine whether a bintree is a leaf
;;recursively
(define leaf?
  (lambda (bintree)
    '()))

;;reference: the difference between = eq? eqv? equal?, refer to 
;;http://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme
;;(eqv? 2 2)