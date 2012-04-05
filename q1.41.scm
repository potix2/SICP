(define (double f)
	(lambda (x) (f (f x))))
(define (inc x) (+ x 1))
(print ((double inc) 1))

; 答え：16足す手続きになるので21が出力される
(print (((double (double double)) inc) 5))
