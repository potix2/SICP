(load "./interval.scm")
(define (div-interval-test)
	(and 
		(guard (exc
				((string? exc) #t))
			(= 0 (lower-bound (div-interval (make-interval 1 2) (make-interval -1 1)))))
		(guard (exc
				((string? exc) #t))
			(= 0 (lower-bound (div-interval (make-interval 1 2) (make-interval 0 1)))))
		(guard (exc
				((string? exc) #t))
			(= 0 (lower-bound (div-interval (make-interval 1 2) (make-interval 1 -1)))))
		(guard (exc
				((string? exc) #t))
			(= 0 (lower-bound (div-interval (make-interval 1 2) (make-interval 1 0)))))
		(guard (exc
				((string? exc) #f))
			(= 1 (lower-bound (div-interval (make-interval 1 1) (make-interval 1 1)))))))
(display (div-interval-test))
(newline)
