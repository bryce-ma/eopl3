#lang scheme

(define one
  (lambda ()
    'one))

('one)

(define (zero)  (diff (one) (one)))
(define is-zero? (lambda (n) (null? n)))
(define successor (lambda (n)
                    ))

(define is-one?
  (lambda (x)
    (equal? x '(1))))
(define predecessor (lambda (n)
                      (if (is-one? n)
                          (zero) 
                          (if (= 0 (car n))
                              (cons (- N 1) (predecessor (cdr n)))
                              (if (and (null? (cdr n)) (= (car n) 1))  
                                  null          ;; after the predecessor operation, the last bit will be zero, so eliminate it
                                  (cons (- (car n) 1) (cdr n)))))))