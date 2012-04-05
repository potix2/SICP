(use slib)
(require 'trace)
(load "./sqrt.scm")

(define (new-if predicate then-clause else-clause)
	(cond
		(predicate then-clause)
		(else else-clause)
	)
)

(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)
	)
)

(trace sqrt-iter)
(sqrt-iter 1.0 2)
