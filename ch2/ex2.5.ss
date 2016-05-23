#lang scheme

;; the alist format is
;; (cons '(v1 2) '((v2 4) (v3 6)))
;; => ((v1 2) (v2 4) (v3 6))

(define empty-env
  (lambda () null))


(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define apply-env
  (lambda (env search-var)
    (if (null? env)
        (report-no-binding-found search-var)
        (let ([saved-var (caar env)]
              [saved-val (cdar env)]
              [saved-env (cdr env)])
          (if (eqv? saved-var search-var)
              saved-val
              (apply-env saved-env search-var))))))

(define report-no-binding-found
  (lambda (search-var)
    (error 'apply-env "No binding for ~s" search-var)))

;; for test
(define e
  (extend-env 'd 6
              (extend-env 'y 8
                          (extend-env 'x 7
                                      (extend-env 'y 14
                                                  (empty-env))))))
(display e)
(newline)
(apply-env e 'y)

;; exercise 2.8
(define empty-env?
  (lambda (env)
    (null? env)))

;; exercise 2.9
(define has-binding?
  (lambda (env s)
    (if (empty-env? env)
        #f
        (let ([saved-var (caar env)]
              [saved-env (cdr env)])
          (if (eqv? saved-var s)
              #t
              (has-binding? saved-env s))))))
(length '(1 2 3))
;; exercise 2.10
(define extend-env*
  (lambda (var-list val-list env)
    (if (= (length var-list) (length val-list))
        (if (= 0 (length var-list))
            env
            (extend-env* (cdr var-list) (cdr val-list) (extend-env (car var-list) (car val-list) env)))
        (error 'extend-env* "var-list and val-list should be same length"))))
;; test for ex2.10
(extend-env* '(a b c) '(1 2 3) (empty-env))
;; => ((c . 3) (b . 2) (a . 1))