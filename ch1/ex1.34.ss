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
  (cdr (path-search n bst)))

(define (path-search n bst)
  (if (leaf? bst)
      (if (= n bst)
          #t)
      (if (= n (root bst))
          '()
          )))

;; return whether or not exists n in bst
(define (deep-first-explore bst n)
  (if (= n (root bst))
      #t
      ())
  (let
      ([left (deep-first-explore (lson bintree) count)])
    (list (contents-of bintree)
          left
          (deep-first-explore (rson bintree) (max-number left))))))
;; todo
(path 17 )
