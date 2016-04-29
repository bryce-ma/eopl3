#lang scheme

(provide merge)

(define (merge loi1 loi2)
  (define (merge-iter l1 l2 result)
    (cond
      [(null? l1) (append result l2)]
      [(null? l2) (append result l1)]
      [(<= (car l1) (car l2))
       (merge-iter (cdr l1) l2 (append result (list (car l1))))]
      [else
       (merge-iter (cdr l2) l1 (append result (list (car l2))))]))
  (merge-iter loi1 loi2 '()))

(merge '(1 4) '(1 2 8))

;(cons '(1 2) '(3 4))
