#lang scheme

;;get the root of a tree
(define (root bst)
  (if (number? bst)
      bst
      (car bst)))

(define (leaf? bst)
  (number? bst))

(define (lson bst)
  (cadr bst))
(define (rson bst)
  (caddr bst))

(define abst '(14 (7 () (12 () ()))
              (26 (20 (17 () ())
                      ())
                  (31 () ()))))
;;test
(lson abst)
(rson abst)


(define (path n bst)
  (path-search n bst '()))

(define (path-search n bst path-list)
  (if (leaf? bst)
      (if (= n bst)
          )
      (if (= n (root bst))
          '()
          )))

(path 17 )
