(load "./calculus.scm")

;
(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(define (make-type-pair expected-type)
			(map
				(lambda (t) (cons t expected-type))
				type-tags))
		(define (valid-coercions? coercions)
			(fold (lambda (x y) (and x y)) (car coercions) (cdr coercions)))
		(define (get-expected-types type-pair-list)
			(map cdr type-pair-list))
		(define (get-coercions type-pair-list)
			(map
				(lambda (pair) (if (eq? (car pair) (cdr pair))
								   (lambda (x) x)
								   (get-coercion (car pair) (cdr pair))))
				type-pair-list))
		(define (apply-each func-list lst)
			(if (and (null? func-list) (null? lst))
				'()
				(cons ((car func-list) (car lst)) (apply-each (cdr func-list) (cdr lst)))))
		(letrec ((proc-rec
					(lambda (type-rest)
						(if (null? type-rest)
							(error "No method for these types -- APPLY GENERIC")
							(let ((type-pair-list (make-type-pair (car type-rest))))
								(let ((coercions (get-coercions type-pair-list)))
									;(display coercions)(newline)
									(if (valid-coercions? coercions)
										(let ((coerced-args (apply-each coercions args))
											  (proc (get op (get-expected-types type-pair-list))))
											(apply proc (map contents coerced-args)))
										(proc-rec (cdr type-rest)))))))))
				(let ((proc (get op type-tags)))
					(if proc
						(apply proc (map contents args))
						(proc-rec type-tags))))))

; scheme-number
(define (install-triple-add-package)
	(define (add-complex z1 z2 z3)
		(make-complex-from-real-imag 
			(+ (real-part z1) (real-part z2) (real-part z3))
			(+ (imag-part z1) (imag-part z2) (imag-part z3))))
	(put 'add3 '(scheme-number scheme-number scheme-number)
		(lambda (x y z) (attach-tag 'scheme-number (+ x y z))))
	(put 'add3 '(complex complex complex)
		 (lambda (x y z) (attach-tag 'complex (add-complex x y z))))
	'done)

(install-scheme-number-package)
(install-rectangular-package)
(install-polar-package)
(install-complex-package)
(install-triple-add-package)
(define (add3 x y z) (apply-generic 'add3 x y z))
(define z1 (make-complex-from-real-imag 100 200))
(define z2 (make-complex-from-real-imag 10 20))
(define z3 (make-complex-from-real-imag 1 2))
;(display (add3 z1 z2 z3))
;(newline)
(display (add3 z1 10 1))
(newline)

;この方法が不適切な理由:
;複数の型が混在する関数を呼び出すことができなくなる
;例えば、
;(put 'some-func '(complex number))
;は'(complex complex)に強制型変換されてしまうので、呼び出すことが出来なくなる
