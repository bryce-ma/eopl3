#lang scheme

;; gloabal variables
(define N 16)

(define zero (lambda () '()))
(define is-zero? (lambda (n) (null? n)))
(define successor (lambda (n)
                    (if (null? n)
                        1
                        (if (< (+ (car n) 1) N)
                            (cons (+ (car n) 1) (cdr n))
                            (cons 0 (successor (cdr n)))))))
(define predecessor (lambda (n)
                      (if (null? n)
                          #f
                          (if (equal? 0 (car n))
                              (cons (- N 1) (predecessor (cdr n)))
                              (cons (- (car n) 1) (cdr n))))))

(successor '(15 3))

(predecessor '(0 3))
