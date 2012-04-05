(load "./q2.36.scm")
(define (dot-product v w)
	(accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
	(map (lambda (t) (dot-product t v)) m))
(define (transpose mat)
	(accumulate-n cons '() mat))
(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		(map (lambda (t) (matrix-*-vector cols t)) m)))

;test
(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define e (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))
(define (matrix-*-vector-test)
	(and
		(equal? (matrix-*-vector m (list 1 0 0)) (list 1 4 7))
		(equal? (matrix-*-vector m (list 0 1 0)) (list 2 5 8))
		(equal? (matrix-*-vector m (list 0 0 1)) (list 3 6 9))))
(define (transpose-test)
	(and
		(equal? (transpose m) (list (list 1 4 7) (list 2 5 8) (list 3 6 9)))
		(equal? (transpose e) (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))))
(define (matrix-*-matrix-test)
	(equal? (matrix-*-matrix m e) m))

(display "matrix-*-vector-test => ")
(display (matrix-*-vector-test))
(newline)
(display "transpose-test => ")
(display (transpose-test))
(newline)
(display "matrix-*-matrix-test => ")
(display (matrix-*-matrix-test))
(newline)
