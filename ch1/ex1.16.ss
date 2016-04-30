#lang scheme
(define invert
	(lambda (lst)
		(if (null? lst)
		    '()
		    (cons (invert-term (car lst))
		          (invert (cdr lst))))))
		         
(define invert-term
	(lambda (lst)
		(cons (car (cdr lst))
		      (car lst))))
		     
(invert '((1 2) (3 4) (a 2)))