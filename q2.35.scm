(load "./accumulate.scm")
(define (count-leaves t)
	(accumulate (lambda (x y) (+ x y))
				0
				(map (lambda (x) (if (pair? x)
									 (count-leaves x)
									 1))
					 t)))
(define (count-leaves-test)
	(and
		(= (count-leaves '()) 0)
		(= (count-leaves (list 1 2)) 2)
		(= (count-leaves (list (list 1))) 1)
		(= (count-leaves (list (list 1 2) (list 3 4))) 4)))
(display (count-leaves-test))
(newline)