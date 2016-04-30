(define duple
	(lambda (n x)
		(if (= n 0) 
		    '()
		    (cons x 
		          (duple (- n 1) x)))))
	
(duple 4 '(ha ha))