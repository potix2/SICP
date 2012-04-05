(load "./q2.84.scm")
(define (install-project-package)
	(put 'project 'rational
		 (lambda (x) (attach-tag 'integer (round (/ (numer x) (denom x))))))
	(put 'project 'real
		 (lambda (x) (attach-tag 'integer (round x))))
	(put 'project 'complex
		 (lambda (x) (make-real (real-part x))))
	(put 'equ? '(real real)
		(lambda (x y) (= x y)))
	'done)

(define (project x)
	(let ((proc (get 'project (type-tag x))))
		(if proc
			(proc (contents x))
			#f)))
(define (drop x)
	(if (pair? x)
		(let ((projected (project x)))
			(if projected
				(if (equ? (raise projected) x)
					(drop projected)
					x)
				x)
			)
		x))
(install-project-package)
(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(drop (apply proc (map contents args)))
				(if (= (length args) 2)
					(let ((type1 (car type-tags))
						  (type2 (cadr type-tags)))
						(if (eq? type1 type2)
							(error "No method for these types -- APPLY-GENERIC"
								   (list op type-tags))
							(let ((args-coerced (fit-args args)))
								(let ((type-tags (map type-tag args-coerced)))
									(let ((proc (get op type-tags)))
										(if proc
											(drop (apply proc (map contents args-coerced)))
											(error "No method for these types" (list op type-tags))))))))
					(error "No method for these types2 -- APPLY-GENERIC"
						   (list op type-tags)))))))
