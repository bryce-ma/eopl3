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
        (let ([saved-vars (caar env)]
              [saved-vals (cadar env)]
              [saved-env (cdr env)])
          (let ([search-result (search-in-pair search-var saved-vars saved-vals)])
            (if (null? search-result)
                (apply-env saved-env search-var)
                search-result))))))

(define search-in-pair
  (lambda (var list1 list2)
    (if (empty? list1)
        null
        (if (eqv? var (car list1))
            (car list2)
            (search-in-pair var (cdr list1) (cdr list2))))))

(define report-no-binding-found
  (lambda (search-var)
    (error 'apply-env "No binding for ~s" search-var)))

(define extend-env*
  (lambda (var-list val-list env)
    (extend-env var-list (list val-list) env)))

(define test-env
  (extend-env* '(a b c) '(1 2 3) (extend-env* (list 'm) (list 5) (empty-env))))
(display test-env)
(newline)
(apply-env test-env 'm)
;; => 5
(apply-env test-env 'b)
;; => 2