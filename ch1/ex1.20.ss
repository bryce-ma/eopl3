#lang scheme

;;exercise 1.20
;;注意空列表返回0
(define (count-occurrences s slist)
  (cond ((null? slist) 0)
        ((list? (car slist)) (+ (count-occurrences s (car slist))
                                (count-occurrences s (cdr slist))))
        (else (+ (count-occurrences s (cdr slist))
                 (if (equal? s (car slist)) 1 0)))))

(count-occurrences 'x '((f x) y (((x z) x))))


