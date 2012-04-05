(define (my-cons x y)
	(* (expt 2 x) (expt 3 y)))
(define (part z p)
	(if (= (remainder z p) 0)
		(+ 1 (my-car (/ z p)))
		0))

(define (my-car z)
	(part z 2))
(define (my-cdr z)
	(part z 3))

; test
(define (my-cdr-test)
	(= 2 (my-cdr (my-cons 1 2))))
(define (my-car-test)
	(= 1 (my-car (my-cons 1 2))))

(print (and (my-cdr-test) (my-car-test)))
