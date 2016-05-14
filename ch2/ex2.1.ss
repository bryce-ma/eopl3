#lang scheme

;; gloabal variables
(define N 16)

(define (zero)  '())
(define is-zero? (lambda (n) (null? n)))
(define successor (lambda (n)
                    (if (is-zero? n)
                        '(1)
                        (if (< (+ (car n) 1) N)
                            (cons (+ (car n) 1) (cdr n))
                            (cons 0 (successor (cdr n)))))))
(define predecessor (lambda (n)
                      (if (is-zero? n)
                          #f
                          (if (equal? 0 (car n))
                              (cons (- N 1) (predecessor (cdr n)))
                              (cons (- (car n) 1) (cdr n))))))

(successor '(15 3))

(predecessor '(0 3))

(define number-bigit
  (lambda (x)
    (if (= x 0)
        (zero)   ;; not "zero", "(zero)"
        (successor (number-bigit (- x 1))))))

(number-bigit 33)
;; => (1 2)
(number-bigit 258)
;; => (2 0 1)

(define fact
  (lambda (x)
    (let ([x-bigit (number-bigit x)])
      (if (is-zero? x-bigit)
        1
        (* x (fact (predecessor x-bigit)))))))

(fact 10)
