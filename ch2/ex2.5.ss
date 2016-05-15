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
              [saved-val (cadr env)]
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
