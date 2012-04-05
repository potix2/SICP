(define (cont-frac n d k)
	(define (iter i ret)
		(if (= i 0)
			ret
			(iter (- i 1) (/ (n i) (+ (d i) ret)))))
	(iter k 0))
(define (tan-cf x k)
	(cont-frac
		(lambda (i) (if (= i 1)
						x
						(- (* x x))))
		(lambda (i) (- (* 2 i) 1))
		k))
(use math.const)
(print (tan-cf (/ pi 4.0) 100))
