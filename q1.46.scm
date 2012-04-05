(define (square x) (* x x))
(define (average x y)
	(/ (+ x y) 2))

(define (iterative-improve good-enough? improve)
	(define (iter guess)
		(if (good-enough? guess)
			guess
			(iter (improve guess))))
	iter)

(define tolerance 0.00001)
(define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))

(define (sqrt x)
	((iterative-improve
		(lambda (guess) (close-enough? x (square guess)))
		(lambda (guess) (average guess (/ x guess))))
	1.0))
(define (fixed-point f first-guess)
	((iterative-improve
		(lambda (x) (< (abs (- x (f x))) tolerance))
		(lambda (x) (f x)))
	first-guess))

(define (sqrt-test)
	(define (sqrt-test-sub n)
		(if (<= n 1)
			#t
			(and (close-enough? n (sqrt (square n)))
				(sqrt-test-sub (- n 1)))))
	(sqrt-test-sub 20))

(define (sqrt-test)
	(define (sqrt-test-sub n)
		(if (<= n 1)
			#t
			(and (close-enough? n (sqrt (square n)))
				(sqrt-test-sub (- n 1)))))
	(sqrt-test-sub 20))
(print (sqrt-test))
(print (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0))
