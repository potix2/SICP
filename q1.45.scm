(load "./fixed-point.scm")
(define dx 0.00001)
(define (compose f g)
	(lambda (x) (f (g x))))
(define (repeated f n)
	(define (iter i)
		(if (= i 1)
			f
			(compose f (iter (- i 1)))))
	(iter n))
;average-damp
(define (average x y)
	(/ (+ x y) 2))
(define (average-damp f)
	(lambda (x) (average x (f x))))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (cube-root x)
	(fixed-point (average-damp (lambda (y) (/ x (square y))))
		1.0))
(define (cube-root x)
	(fixed-point (average-damp (lambda (y) (/ x (square y))))
		1.0))
;動かないことが確認できた
;(define (forth-root x)
;	(fixed-point (average-damp (average-damp (lambda (y) (/ x (cube y)))))
;		1.0))

; http://www.csus4.net/hiki/SICPReading/?EijiroSumii
;
; この解説によると、n乗根をもとめるためにaverage dampingをi回行った場合、
; 収束条件はn < 2^(i+1)になるのでaverage dampingをlog2(n) + 1回行えばよい
(define (log2 x)
	(if (= x 1)
		0
		(+ 1 (log2 (quotient x 2)))))

(define (nth-root x n)
	(let ((r (log2 n)))
		(fixed-point
			((repeated average-damp r)
				(lambda (y) (/ x (expt y (- n 1)))))
			1.0)))
(define (test-root)
	(define (test-root-sub n)
		(if (<= n 1)
			#t
			(and (close-enough? 1.23 (nth-root (expt 1.23 n) n))
				(test-root-sub (- n 1)))))
	(test-root-sub 20))
(print (test-root))
