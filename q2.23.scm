(define (my-for-each f l)
	(define (iter ll dummy)
		(if (null? ll)
			#t
			(iter (cdr ll) (f (car ll)))))
	(iter l #f))
(my-for-each (lambda (x) (newline) (display x)) (list 57 321 88))
