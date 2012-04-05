(define (mystery x)
	(define (loop x y)
		(if (null? x)
			y
			(let ((temp (cdr x)))
				(set-cdr! x y)
				(loop temp x))))
	(loop x '()))
(define v (list 'a 'b 'c 'd))
(display v)
(newline)
(display (mystery v))
