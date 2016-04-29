#lang scheme

(require "atom.ss")

;; remove all inner parentheses of s-expresion-list 
(define (flatten slist)
  (if (list? slist)
      (if (null? slist)
          '()
          (append (flatten (car slist))
                (flatten (cdr slist))))
      (list slist)))

(flatten '((a b) c (((d)) e)))
