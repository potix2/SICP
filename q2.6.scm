(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
	(lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (church2numeral c)
	((c (lambda (x) (+ x 1))) 0))
(define (church-add a b)
	(lambda (f)
		(lambda (x) ((a f) ((b f) x)))))
(print (= (church2numeral one) 1))
(print (= (church2numeral two) 2))
(print (= (church2numeral (church-add one two)) 3))
(print (= (church2numeral (church-add two two)) 4))
