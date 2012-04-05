;(+ (f 0) (f 1))

(define x 0)
(define (f arg)
	(let ((val x))
		(begin (set! x arg) val)))
(display (+ (f 0) (f 1)))
;(display (+ (f 1) (f 0)))
