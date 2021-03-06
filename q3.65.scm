(load "./stream.scm")
(define (square x)
	(* x x))
(define (partial-sums s)
	(cons-stream (stream-car s)
		(add-streams (stream-cdr s)
					 (partial-sums s))))
(define (ln-summands n)
	(stream-cons (/ 1.0 n)
				 (stream-map - (ln-summands (+ 1 n)))))
(define ln-stream
	(partial-sums (ln-summands 1)))
(define (euler-transform s)
	(let ((s0 (stream-ref s 0))
		  (s1 (stream-ref s 1))
		  (s2 (stream-ref s 2)))
		(stream-cons (- s2 (/ (square (- s2 s1))
							  (+ s0 (* -2 s1) s2)))
					 (euler-transform (stream-cdr s)))))
(display-stream (stream-take (euler-tranform (ln-stream)) 10))
