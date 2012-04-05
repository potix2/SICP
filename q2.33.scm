(load "./accumulate.scm")
; map
(define (map p sequence)
	(accumulate (lambda (x y) (cons (p x) y)) '() sequence))
(define (square x) (* x x))
;test
(define (map-test)
	(and
		(equal? (map square '()) '())
		(equal? (map square (list 2)) (list 4))
		(equal? (map square (list 1 2 3 4)) (list 1 4 9 16))))
(display (map-test))
(newline)

; append
(define (append seq1 seq2)
	(accumulate cons seq2 seq1))
;test
(define (append-test)
	(and
		(equal? (append '() '()) '())
		(equal? (append '() (list 1)) (list 1))
		(equal? (append (list 1) '()) (list 1))
		(equal? (append (list 1 2 3) (list 4 5 6)) (list 1 2 3 4 5 6))))
(display (append-test))
(newline)

; length
(define (length sequence)
	(accumulate (lambda (x y) (+ 1 y)) 0 sequence))
;test
(define (length-test)
	(and
		(= (length '()) 0)
		(= (length (list 5)) 1)
		(= (length (list 5 4 3 2 1)) 5)))
(display (length-test))
(newline)
