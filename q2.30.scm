(define (square x)
	(* x x))
(define (square-tree t)
	(if (null? t)
		'()
		(cons
			(if (pair? (car t))
				(square-tree (car t))
				(square (car t)))
			(square-tree (cdr t)))))
(define (square-tree-test)
	(and
		(equal?
			(square-tree
				(list 1
					(list 2 (list 3 4) 5)
					(list 6 7)))
			(list 1
				(list 4 (list 9 16) 25)
				(list 36 49)))))
(display (square-tree-test))
(newline)
