#lang scheme

(define (list-index pred lst)
  (list-index-iter pred lst 0))

(define (list-index-iter pred lst start)
  (if (null? lst)
      #f
      (if (pred (car lst))
          start
          (list-index-iter pred (cdr lst) (+ 1 start)))))

(list-index number? '(a 2 (1 3) b 7))

(list-index symbol? '(1 2 (a b) 3))