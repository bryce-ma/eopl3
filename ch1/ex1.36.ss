#lang scheme

;; use the procedure list-length from the textbook
(define list-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (list-length (cdr lst))))))

(define (g init already-numbered)
  (let* ([len (list-length already-numbered)]  ;; let* make variables len and index in one single scope 
         [index (add1 (caar already-numbered))])  ;; index is the number that init should be assigned
    (cons (list index (cdar init))
          already-numbered)))

(define number-elements
  (lambda (lst)
    (if (null? lst) '()
        (g (list 0 (car lst)) (number-elements (cdr lst))))))

(number-elements '((1 3) (1 4) 6))