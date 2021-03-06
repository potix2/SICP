(define (new-count-pairs x)
	(define tracelist '())
	(define (count-pairs x)
		(cond ((not (pair? x)) 0)
			  ((memq x tracelist) 0)
			  (else
			  	(set! tracelist (cons x tracelist))
				(+ (count-pairs (car x))
				   (count-pairs (cdr x))
				   1))))
	(count-pairs x))
(define a (cons 'foo 'bar))
(define b (cons a a))
(define l7 (cons b b))
(define l4 (cons a (cons 'foo a)))
(define l3 (cons (cons 'foo 'bar) (cons 'foo 'bar)))
(define c (list 'foo))
(define ll (cons 'foo (cons 'foo c)))
(set-car! c ll)
(display (new-count-pairs l4))
(newline)
(display (new-count-pairs l3))
(newline)
(display (new-count-pairs ll))
(newline)
