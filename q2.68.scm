(load "./q2.67.scm")
(define (encode  message tree)
	(if (null? message)
		'()
		(append (encode-symbol (car message) tree)
				(encode (cdr message) tree))))
(define (encode-symbol symbol tree)
	(define (encode-symbol-branch symbol branch)
		(if (null? branch)
			(error "bad symbol -- ENCODE-SYMBOL" symbol)
			(if (and (leaf? branch) (eq? symbol (symbol-leaf branch)))
				'()
				(let ((lb (left-branch branch))
				      (rb (right-branch branch)))
					(cond ((contains symbol (symbols lb)) (cons 0 (encode-symbol-branch symbol lb)))
						  ((contains symbol (symbols rb)) (cons 1 (encode-symbol-branch symbol rb)))
						  (else (error "bad symbol -- ENCODE-SYMBOL" symbol)))))))
	(encode-symbol-branch symbol tree))
(define (contains x lst)
	(cond ((null? lst) #f)
		  ((eq? x (car lst)) #t)
		  (else (contains x (cdr lst)))))
;(define sample-tree1
;	(make-code-tree (make-leaf 'A 8)
;					(make-code-tree (make-code-tree (make-leaf 'B 3)
;													(make-code-tree (make-leaf 'C 1) (make-leaf 'D 1)))
;									(make-code-tree (make-code-tree (make-leaf 'E 1) (make-leaf 'F 1))
;													(make-code-tree (make-leaf 'G 1) (make-leaf 'H 1))))))
;(define (encode-test)
;	(equal? (encode '(B A C A D A E A F A B B A A A G A H) sample-tree1)
;			'(1 0 0 0 1 0 1 0 0 1
;			  0 1 1 0 1 1 0 0 0 1
;			  1 0 1 0 1 0 0 1 0 0
;			  0 0 0 1 1 1 0 0 1 1
;			  1 1)))
(define (encode-test)
	(equal? (encode (decode sample-message sample-tree) sample-tree) sample-message))
;(display (encode-test))
;(display sample-tree)
;(newline)
