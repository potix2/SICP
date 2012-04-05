(define (cont-frac n d k)
	(define (iter i ret)
		(if (= i 0)
			ret
			(iter (- i 1) (/ (n i) (+ (d i) ret)))))
	(iter k 0))
(print
	(+ (cont-frac
		(lambda (i) 1.0)
		(lambda (i) (cond
			((= i 1) 1)
			((= (remainder (+ i 1) 3) 0) (* 2 (/ (+ i 1) 3)))
			(else 1)))
		100)
		2))
