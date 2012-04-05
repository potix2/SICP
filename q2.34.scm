(load "./accumulate.scm")
(define (hourner-eval x coefficient-sequence)
	(accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
				0
				coefficient-sequence))
;test
(define (hourner-eval-test)
	(and
		(= (hourner-eval 0 (list 1 3 0 5 0 1)) 1)
		(= (hourner-eval 1 (list 1 3 0 5 0 1)) 10)
		(= (hourner-eval 2 (list 1 3 0 5 0 1)) 79)))
(display (hourner-eval-test))
(newline)
