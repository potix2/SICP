(define (make-queue)
	(let ((front-ptr '())
		  (rear-ptr '()))
	(define (set-front-ptr! item) (set! front-ptr item))
	(define (set-rear-ptr! item) (set! rear-ptr item))
	(define (empty-queue?) (null? front-ptr))
	(define (front-queue)
		(if (empty-queue?)
			(error "FRONT called with an empty queue")
			(car front-ptr)))
	(define (insert-queue! item)
		(let ((new-pair (cons item '())))
			(cond ((empty-queue?)
				   (set-front-ptr! new-pair)
				   (set-rear-ptr! new-pair))
				  (else
				   (set-cdr! rear-ptr new-pair)
				   (set-rear-ptr! new-pair)
				   ))))
	(define (delete-queue!)
		(cond ((empty-queue?)
			   (error "DELETE! called with an empty queue"))
			  (else
			   (set-front-ptr! (cdr front-ptr))
			   )))
	(define (print-queue)
		(define (iter l)
			(if (null? l)
				(newline)
				(begin
					(display (car l))
					(iter (cdr l)))))
		(iter front-ptr))
	(define (dispatch m)
		(cond ((eq? m 'empty?) empty-queue?)
			  ((eq? m 'front) front-queue)
			  ((eq? m 'insert!) insert-queue!)
			  ((eq? m 'delete!) delete-queue!)
			  ((eq? m 'print) print-queue)
			  (else (error "Undefined operation -- QUEUE" m))))
	dispatch))
(define q1 (make-queue))
((q1 'insert!) 'a)
((q1 'print))
((q1 'insert!) 'b)
((q1 'print))
((q1 'insert!) 'c)
((q1 'print))
((q1 'delete!))
((q1 'print))
((q1 'delete!))
((q1 'print))
((q1 'delete!))
((q1 'print))
