(load "./rat.scm")
(define (make-rat-test)
	(and
		(= 1 (numer (make-rat 1 3)))
		(= 3 (denom (make-rat 1 3)))
		(= -1 (numer (make-rat -1 3)))
		(= 3 (denom (make-rat -1 3)))
		(= -1 (numer (make-rat 1 -3)))
		(= 3 (denom (make-rat 1 -3)))
		(= 1 (numer (make-rat -1 -3)))
		(= 3 (denom (make-rat -1 -3)))))
(display (make-rat-test))
