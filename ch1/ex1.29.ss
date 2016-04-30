#lang scheme

(require "ex1.28.ss")

;; sort a list of integer
;; using merge sort
(define (sort loi)
  (merge-sort loi))

(define (merge-sort loi)
  (if (null? loi)
      '()
      (if (null? (cdr loi))
          loi
          (merge
           (merge-sort (odd-numbers loi))
           (merge-sort (even-numbers loi))))))

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

(sort '(8 2 5 2 3))