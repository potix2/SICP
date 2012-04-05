;list-of-values
;left to right
(define (list-of-values exps env)
	(if (no-operands? exps)
		'()
		(let ((evaluated-exp (eval (first-operand exps) env)))
			(cons evaluated-exp
			  	  (list-of-values (rest-operands exps) env)))))

;right to left
(define (list-of-values exps env)
	(if (no-operands? exps)
		'()
		(let ((evaluated-exp (list-of-values (rest-operands exps) env)))
			(cons (eval (first-operand exps) env)
				  evaluated-exp))))
			  	  

