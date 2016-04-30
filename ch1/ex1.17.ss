#lang scheme

(provide down)

;;exercise 1.17
(define down
	(lambda (lst)
		(if (null? (cdr lst))
		    (wrap (wrap (car lst)))  ;; last element need be wrapped twice because cons treat the second parameter as a list
		    (cons (wrap (car lst))
		          (down (cdr lst))))))
		         
;; todo: wrap a top level term		         
(define wrap
	(lambda x x))


(down '(1 2 3))