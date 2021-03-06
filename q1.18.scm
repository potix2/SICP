(define (double x) (+ x x))
(define (halve x)
	(if (even? x)
		(/ x 2)
		x
	)
)
(define (multi a b)
	(define (iter iq a b)
		(cond
			((= b 0) iq)
			((even? b) (iter iq (double a) (halve b)))
			(else (iter (+ iq a) a (- b 1)))
		)
	)
	(iter 0 a b)
)
