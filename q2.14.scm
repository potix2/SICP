(load "./q2.12.scm")
(define (par1 r1 r2)
	(div-interval (mul-interval r1 r2)
				  (add-interval r1 r2)))
(define (par2 r1 r2)
	(let ((one (make-interval 1 1)))
		(div-interval one
				  (add-interval (div-interval one r1)
				  				(div-interval one r2)))))
(define A (make-interval 1 2))
(define B (make-interval 3 4))
(define C (make-center-percent 10 0.1))

(display "A => ")
(print-interval A)
(display "B => ")
(print-interval B)
(display "C => ")
(print-interval C)

(display "A/A => ")
(print-interval (div-interval A A))
(display "B/B => ")
(print-interval (div-interval B B))
(display "C/C => ")
(print-interval (div-interval C C))

(display "A/B => ")
(print-interval (div-interval A B))
(display "B/C => ")
(print-interval (div-interval B C))
(display "C/A => ")
(print-interval (div-interval C A))