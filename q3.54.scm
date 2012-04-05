(load "./stream.scm")
(define (mul-stream s1 s2)
	(stream-map * s1 s2))
(define factorials
	(cons-stream 1
		(mul-streams (stream-cdr integers)
					 factorials)))
(display (stream-ref factorials 2))
