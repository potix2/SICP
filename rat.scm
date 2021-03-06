(load "./gcd.scm")
(define (add-rat x y)
	(meke-rat (- (* (numer x) (denom y))
				 (* (numer y) (denom x)))
			  (* (denom x) (denom y))))
(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
				 (* (numer y) (denom x)))
			  (* (denom x) (denom y))))
(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
			  (* (denom x) (denom y))))
(define (div-rat x y)
	(meke-rat (* (numer x) (denom y))
			  (* (denom x) (numer y))))
(define (equal-rat? x y)
	(= (* (numer x) (denom y))
	   (* (numer y) (denom x))))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))
(define (make-rat n d)
	(let ((g (abs (gcd n d))))
		(if
			(or (and (> n 0) (< d 0)) (and (< n 0) (< d 0)))
			(cons (* -1 (/ n g)) (* -1 (/ d g)))
			(cons (/ n g) (/ d g)))))
