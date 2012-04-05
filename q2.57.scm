(load "./deriv.scm")
(define (multiplicand p)
	(if (null? (cdr (cddr p)))
		(caddr p)
		(cons '* (cddr p))))
(define (augend s)
	(if (null? (cdr (cddr s)))
		(caddr s)
		(cons '+ (cddr s))))