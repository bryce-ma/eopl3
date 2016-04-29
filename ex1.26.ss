#lang scheme

(require "ex1.17.ss")

(define (up lst)
  (cond
    [(null? lst) '()]
    [(list? (car lst)) (append (car lst)
                         (up (cdr lst)))]
    [else lst]))

(up '((1 2) (3 4)))

(up '((x (y)) z))

;;(up (down lst)) is equivalent to lst, but (down (up lst)) is
;;not necessarily lst. -- the text
(up (down '((x (y)) z)))
(down (up '((x (y)) z)))