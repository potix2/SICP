(define (abs x)
	(if (< 0 x)
		x
		(* x -1)
	)
)
(define (cube x) (* x x x))
(define (p x)
	(print "p => " x);
	(- (* 3 x) (* 4 (cube x))))
(define (sine angle)
	(if (not (> (abs angle) 0.1))
		angle
		(p (sine (/ angle 3.0)))
	)
)
