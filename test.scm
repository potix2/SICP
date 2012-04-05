(define (fact x)
	(print x)
	(if (= x 0)
		1
		(* x (fact (- x 1)))
	)
)

(let
	((p (lambda (x y) (* 2 x))))
	(p (+ 2 4) (fact 150))
)

;(let
;	((p (lambda (x y) (* 2 (x)))))
;	(p (lambda () (+ 2 4)) (lambda() ((fact 150))))
;)
