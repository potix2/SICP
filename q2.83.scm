(load "./calculus.scm")
; scheme-number
(define (install-raise-package)
	(put 'raise '(scheme-number)
		 (lambda (x) (attach-tag 'integer x)))
	(put 'raise '(integer)
		 (lambda (x) (make-rational x 1)))
	(put 'raise '(rational)
		 (lambda (x) (attach-tag 'real (/ (numer x) (denom x)))))
	(put 'raise '(real)
		 (lambda (x) (make-complex-from-real-imag x 0)))
	'done)

;(define (raise x) (apply-generic 'raise x))
(define (raise x)
	(let ((proc (get 'raise (type-tag x))))
		(if proc
			(proc (contents x))
			x)))
(install-scheme-number-package)
(install-rational-package)
(install-rectangular-package)
(install-polar-package)
(install-complex-package)
(install-raise-package)
(define (make-integer x)
	(attach-tag 'integer x))
(define (make-real x)
	(attach-tag 'real x))
