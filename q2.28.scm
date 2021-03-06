(define (fringe l)
	(if (null? l)
		'()
		(if (pair? (car l))
			(append (fringe (car l)) (fringe (cdr l)))
			(cons (car l) (fringe (cdr l))))))
(define (fringe-test)
	(let ((x (list (list 1 2) (list 3 4))))
		(and
			(equal? (fringe x) (list 1 2 3 4))
			(equal? (fringe (list x x)) (list 1 2 3 4 1 2 3 4)))))
(display (fringe-test))
(newline)
