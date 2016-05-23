#lang scheme

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

(define extend-env*
  (lambda (var-list val-list env)
    (extend-env var-list (list val-list) env)))

(define test-env
  (extend-env* '(a b c) '(1 2 3) (extend-env 'm 5 (empty-env))))
(apply-env test-env 'm)
;; => 5
(apply-env test-env 'b)
;; => 2