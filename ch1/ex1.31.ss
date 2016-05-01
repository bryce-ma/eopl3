#lang scheme

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
;;recursively
(define leaf?
  (lambda (bintree aleaf)
    (if (equal? aleaf bintree)
        #t
        (if (list? bintree)
            (or (leaf? (lson bintree) aleaf)
                (leaf? (rson bintree) aleaf))
            #f))))


;;building tree test
(interior-node 'bar
               (leaf 26)
               (leaf 12))

(lson '(bar (bar 1 3) (bar 1 4)))
(rson '(bar (bar 1 3) (bar 1 4)))
(leaf? '(bar (bar 1 3) (bar 1 4)) '(bar 1 4))

(eqv? '(1) '(1)) ;;#f
(equal? '(1) '(1)) ;;#t
;;reference: the difference between = eq? eqv? equal?, refer to 
;;http://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme
;;(eqv? 2 2)