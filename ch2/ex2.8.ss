#lang scheme

;; copy from ex2.5.ss file
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

;; exercise 2.8
(define empty-env?
  (lambda (env)
    (null? env)))