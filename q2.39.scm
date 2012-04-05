(load "./q2.38.scm")
;test
(define (reverse-test)
	(and
		(equal? (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1))
		(equal? (reverse (list 1)) (list 1))
		(equal? (reverse '()) '())))

(define (reverse sequence)
	(fold-right (lambda (x y) (cons x y)) '() sequence))
(display "reverse-test(fold-right) => ")
(display (reverse-test))
(newline)

(define (reverse sequence)
	(fold-left (lambda (x y) (append y (list x))) '() sequence))
(display "reverse-test(fold-left) => ")
(display (reverse-test))
(newline)
