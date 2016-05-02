#lang scheme

;; ex1.34
;; must explore the left son of the tree first
(define (number-leaves bintree)
  (deep-first-explore bintree 0))

(define (deep-first-explore bintree count)
  (if (leaf? bintree)
      count
      (let
          ([left (deep-first-explore (lson bintree) (+ 1 count))])
        ())))

;;find the maximume in the tree
;; i.e. the right-deepest number
(define (max-number bintree)
  (if (leaf? bintree)
      bintree
      (max-number (rson bintree))))