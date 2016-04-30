#lang scheme

(define (merge-pred pred loi1 loi2)
  (define (merge-iter l1 l2 result)
    (cond
      [(null? l1) (append result l2)]
      [(null? l2) (append result l1)]
      [(pred (car l1) (car l2))
       (merge-iter (cdr l1) l2 (append result (list (car l1))))]
      [else
       (merge-iter (cdr l2) l1 (append result (list (car l2))))]))
  (merge-iter loi1 loi2 '()))

;; sort a list of integer
;; using merge sort
(define (sort/predicate pred loi)
  (merge-sort pred loi))

(define (merge-sort pred loi)
  (if (null? loi)
      '()
      (if (null? (cdr loi))
          loi
          (merge-pred
           pred
           (merge-sort pred (odd-numbers loi))
           (merge-sort pred (even-numbers loi))))))

;; get the half of even positions
(define (even-numbers lst)
  (if (null? lst)
      '()
      (if (null? (cdr lst))
          '()
          (cons (car (cdr lst))
                (even-numbers (cdr (cdr lst)))))))

;; get the half of odd positions
(define (odd-numbers lst)
  (if (null? lst)
      '()
      (if (null? (cdr lst))
          lst
          (cons (car lst)
                (odd-numbers (cdr (cdr lst)))))))

(sort/predicate < '(8 2 5 2 3))
(sort/predicate > '(8 2 5 2 3))