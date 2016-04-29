#lang scheme

;;exercise 1.18
(define (swapper s1 s2 slist)
  (cond ((null? slist) '())
        ((list? (car slist)) (cons (swapper s1 s2 (car slist)) (swapper s1 s2 (cdr slist))))
        ((equal? s1 (car slist)) (cons s2 (swapper s1 s2 (cdr slist))))
        ((equal? s2 (car slist)) (cons s1 (swapper s1 s2 (cdr slist))))
        (else (cons (car slist) (swapper s1 s2 (cdr slist))))))

(swapper 'a 'd '(a b c d))
(swapper 'x 'y '((x) y (z (x))))