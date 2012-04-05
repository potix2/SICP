(define (sum-square a b)
	(+ (* a a) (* b b))
)

(define (>= a b)
	(or (> a b) (= a b))
)

(define (q13 a b c)
	(cond
		((and (>= a c) (>= b c)) (sum-square a b))
		((and (>= a b) (>= c b)) (sum-square a c))
		(else (sum-square b c))
	)
)
