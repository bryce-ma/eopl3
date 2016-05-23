#lang scheme

(define empty-stack
  (lambda ()
    (error 'stack "empty stack")))

(define push
  (lambda (stack x)
    (lambda ()
      x)))

(define pop
  (lambda (stack)
    (lambda ()
      )))