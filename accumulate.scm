(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence)
			(accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))
