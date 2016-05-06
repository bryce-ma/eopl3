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

;; idea: if the subtree of bst contains n,
;; then append #t on the head of returned list, otherwise append #f.
(define (path n bst)
  (let ([result (path-search n bst)])
    (if (car result)            ;;contains n
        (cdr (path-search n bst))
        null)))

(define (path-search n bst)
  (if (null? bst)
      (cons #f null)
      (if (= n (root bst))
          (cons #t null)
          (let ([left-result (path-search n (lson bst))]
                [right-result (path-search n (rson bst))])
            (cond [(car left-result) (cons #t (cons 'left (cdr left-result)))]
                  [(car right-result) (cons #t (cons 'right (cdr right-result)))]
                  [else (cons #f null)])))))

;; test
(path 17 abst)
;; => (right left left)
