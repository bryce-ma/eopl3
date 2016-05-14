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
(define one
  (lambda ()
    (successor zero)))
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

;; essential operators of bigit
(define add-bigit
  (lambda (x y)
    (cond [(is-zero? x) y]
          [(is-zero? y) x]
          [else (cons (remainder (+ (car x) (car y))
                                 N)
                      (if (>= (+ (car x) (car y)) N)  
                          (add-bigit (cons (+ 1 (if (null? (cdr x))  ;;需要进位 overflow happens, so need to augment the higher bit. x = (8 2 3) would become (3 3)
                                                    0
                                                    (cadr x)))
                                           (if (null? (cdr x))
                                               null
                                               (cddr x)))
                                     (cdr y))   
                          (add-bigit (cdr x) (cdr y))))])))

(add-bigit '(14) '(2 3))
;; => (0 4)

(define multiply-bigit
  (lambda (x y)
    (cond [(or (is-zero? x) (is-zero? y)) (zero)]
          [(eqv? one x) y]
          [(eqv? one y) x]
          [else (add-bigit y (multiply-bigit (predecessor x) y))])))

(multiply-bigit '(3) '(5))
;; => (15)

(successor '(15 3))

(predecessor '(0 3))

;; number to bigit
(define number-bigit
  (lambda (x)
    (if (= x 0)
        (zero)   ;; not "zero", "(zero)"
        (successor (number-bigit (- x 1))))))

;; bigit to number
(define bigit-number
  (lambda (x)
    (if (is-zero? x)
        0
        (+ (car x)
           (* N (bigit-number (cdr x)))))))
(bigit-number '(1 2))
;; => 33

(number-bigit 33)
;; => (1 2)
(number-bigit 258)
;; => (2 0 1)

(define fact
  (lambda (x)
    (define fact-bigit
      (lambda (x-bigit)
        (if (is-zero? x-bigit)
            one
            (multiply-bigit x-bigit (fact-bigit (predecessor x-bigit))))))
    (bigit-number (fact-bigit (number-bigit x)))))

(fact 10)
;; 3628800

;; running time
(map (lambda (x) (time (fact x))) (list 50 100 150 200 250 300) )


