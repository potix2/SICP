(load "./q2.83.scm")
(define (higher-definition type-list)
	(lambda (t1 t2)
		(if (memq t2 (cdr (memq t1 type-list)))
			#t
			#f)))
(define higher? (higher-definition '(complex real rational integer scheme-number)))
(define (fit-args args)
	(let ((a1 (car args))
		  (a2 (cadr args)))
		(let ((t1 (type-tag a1))
			  (t2 (type-tag a2)))
			(if (eq? t1 t2)
				args
				(if (higher? t1 t2)
					(fit-args (list a1 (raise a2)))
					(fit-args (list (raise a1) a2)))))))
(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map contents args))
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
											(apply proc (map contents args-coerced))
											(error "No method for these types" (list op type-tags))))))))
					(error "No method for these types2 -- APPLY-GENERIC"
						   (list op type-tags)))))))