#lang scheme

(require  "ex1.31-bintree.ss")
;; ex1.34
;; must explore the left son of the tree first
(define (number-leaves bintree)
  (deep-first-explore bintree -1))

(define (deep-first-explore bintree count)
  (if (leaf? bintree)
      (+ 1 count)   ;; only increment when encounter leaves
      (let
          ([left (deep-first-explore (lson bintree) count)])
        (list (contents-of bintree)
              left
              (deep-first-explore (rson bintree) (max-number left))))))

;;find the maximume in the numbered tree
;; i.e. the right-deepest number
(define (max-number bintree)
  (if (leaf? bintree)
      bintree
      (max-number (rson bintree))))

(number-leaves
 (interior-node 'foo
                (interior-node 'bar
                               (leaf 26)
                               (leaf 12))
                (interior-node 'baz
                               (leaf 11)
                               (interior-node 'quux
                                              (leaf 117)
                                              (leaf 14)))))