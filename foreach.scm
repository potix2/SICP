(define (for-each f l)
	(define (iter ll dummy)
		(if (null? ll)
			#t
			(iter (cdr ll) (f (car ll)))))
	(iter l #f))
