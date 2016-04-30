#lang scheme

;;exercise 1.22
(define (filter-in pred lst)
  (if (null? lst)
      '()
      (cons (if (pred (car lst))
                (car lst)
                '())
            (filter-in pred (cdr lst)))))

(filter-in number? '(a 2 (1 3) b 7))

