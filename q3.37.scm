(load "./constraint.scm")
(define (c+ x y)
	(let ((z (make-connector)))
		(adder x y z)
		z))
(define (c* x y)
	(let ((z (make-connector)))
		(multiplier x y z)
		z))
(define (cv c)
	(let ((z (make-connector)))
		(constant c z)
		z))
(define (c- x y)
	(c+ x (c* y (cv -1))))
(define (c/ x y)
	(let ((z (make-connector)))
		(multiplier z x y)
		z))
