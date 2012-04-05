(define (last-pair l)
	(cond ((null? l) '())
		  ((null? (cdr l)) (list (car l)))
		  (else (last-pair (cdr l)))))
(define (last-pair-test)
	(and
		(null? (last-pair '()))
		(equal? (last-pair (list 1 2 3 4 5)) (list 5))
		(equal? (last-pair (list 5 4 3 2 1)) (list 1))))
(display (last-pair-test))
(newline)
