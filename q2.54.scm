(define (equal? list1 list2)
	(if (and (pair? list1) (pair? list2))
		(and
			(equal? (car list1) (car list2))
			(equal? (cdr list1) (cdr list2)))
		(eq? list1 list2)))
(define (equal?-test)
	(and
		(equal? '() '())
		(equal? '(a b c) '(a b c))
		(equal? '(a (b c)) '(a (b c)))
		(equal? 1 1)
		(not (equal? 1 2))
		(not (equal? '(this is a list) '(this (is a) list)))
		(not (equal? '() '(a b)))
		(not (equal? '(a b) '()))
))
(display (equal?-test))
