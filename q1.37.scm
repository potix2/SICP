; 再帰的
(define (cont-frac n d k)
	(define (iter i)
		(if (= i k)
			(/ (n i) (d i))
			(/ (n i) (+ (d i) (iter (+ i 1))))))
	(iter 1))
; 反復的
(define (cont-frac2 n d k)
	(define (iter i ret)
		(if (= i 0)
			ret
			(iter (- i 1) (/ (n i) (+ (d i) ret)))))
	(iter k 0))


; 答え(a)：１１くらい
(print
	(cont-frac2
		(lambda (i) 1.0)
		(lambda (i) 1.0)
		11))
