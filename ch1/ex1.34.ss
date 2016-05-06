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

;; idea: if the subtree of bst contains n,
;; then append #t on the head of returned list, otherwise append #f.
(define (path n bst)
  (let ([result (path-search n bst)])
    (if (car result)            ;;contains n
        (cdr (path-search n bst))
        null)))

(define (path-search n bst)
  (if (null? bst)
      null
      (if (= n (root bst))
          #t
          (path-search n ()))))

;; todo
(path 17 abst)
