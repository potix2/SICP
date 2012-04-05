;2.78
(define (attach-tag type-tag contents)
	(if (eq? type-tag 'scheme-number)
		contents
		(cons type-tag contents)))
(define (type-tag datum)
	(cond ((number? datum) 'scheme-number)
		  ((pair? datum) (car datum))
		  (else (error "Bad tagged datum -- TYPE-TAG" datum))))
(define (contents datum)
	(cond ((number? datum) datum)
		  ((pair? datum) (cdr datum))
		  (else (error "Bad tagged datum -- CONTENTS" datum))))
;(define (apply-generic op . args)
;for 2.77
;	(display "called apply-generic: op=")
;	(display op)
;	(display " args=")
;	(display args)
;	(newline)
;	(let ((type-tags (map type-tag args)))
;		(let ((proc (get op type-tags)))
;			(if proc
;				(apply proc (map contents args))
;				(error
;					"No method for these types -- APPLY-GENERIC"
;					(list op type-tags))))))

;2.81
(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map contents args))
				(if (= (length args) 2)
					(let ((type1 (car type-tags))
						  (type2 (cadr type-tags))
						  (a1 (car args))
						  (a2 (cadr args)))
						;追加
						(if (eq? type1 type2)
							(error "No method for these types -- APPLY-GENERIC"
								   (list op type-tags))
							(let ((t1->t2 (get-coercion type1 type2))
								  (t2->t1 (get-coercion type2 type1)))
								(cond (t1->t2
										(apply-generic op (t1->t2 a1) a2))
									  (t2->t1
									  	(apply-generic op a1 (t2->t1 a2)))
									  (else
										(error "No method for these types -- APPLY-GENERIC"
											   (list op type-tags)))))))
					(error "No method for these types -- APPLY-GENERIC"
						   (list op type-tags)))))))

(load "./put-get.scm")
(define put-get (put-get-gen))
(define put (car put-get))
(define get (cadr put-get))
(define put-get-coercion (put-get-gen))
(define put-coercion (car put-get-coercion))
(define get-coercion (cadr put-get-coercion))
