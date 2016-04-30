#lang scheme

(provide atom?)

(define (atom? x)
   (ormap (lambda (p) (p x)) (list number? symbol? boolean? string?)))