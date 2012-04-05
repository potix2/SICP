(define (make-queue)
	(let ((front-ptr '())
		  (rear-ptr '()))
		(define (set-front-ptr! item) (set! front-ptr item))
		(define (set-rear-ptr! item) (set! rear-ptr item))
		(define (empty-queue?)
			(and (null? front-ptr) (null? rear-ptr)))
		(define (front-queue)
			(if (empty-queue?)
				(error "FRONT called with an empty queue")
				(car front-ptr)))
		(define (rear-queue)
			(if (empty-queue?)
				(error "REAR called with an empty queue")
				(car rear-ptr)))
		(define (front-insert-queue! item)
			(let ((new-pair (cons item (cons '() front-ptr))))
				(cond ((empty-queue?)
				   (set-front-ptr! new-pair)
				   (set-rear-ptr! new-pair))
				  (else
				   (set-car! (cdr front-ptr) new-pair)
				   (set-front-ptr! new-pair)
				   ))))
		(define (rear-insert-queue! item)
			(let ((new-pair (cons item (cons rear-ptr '()))))
				(cond ((empty-queue?)
				   (set-front-ptr! new-pair)
				   (set-rear-ptr! new-pair))
				  (else
				   (set-cdr! (cdr rear-ptr) new-pair)
				   (set-rear-ptr! new-pair)
				   ))))
		(define (front-delete-queue!)
			(cond ((empty-queue?)
				   (error "FRONT-DELETE! called with an empty queue"))
				  ((null? (cddr front-ptr))
				   (set-front-ptr! '())
				   (set-rear-ptr! '()))
				  (else
				   (set-front-ptr! (cddr front-ptr))
				   (set-car! (cdr front-ptr) '())
				   )))
		(define (rear-delete-queue!)
			(cond ((empty-queue?)
				   (error "REAR-DELETE! called with an empty queue"))
				  ((null? (cadr rear-ptr))
				   (set-front-ptr! '())
				   (set-rear-ptr! '()))
				  (else
				   (set-rear-ptr! (cadr rear-ptr))
				   (set-cdr! (cdr rear-ptr) '())
				   )))
		(define (print-queue)
			(define (iter l)
				(if (null? l)
					(newline)
					(begin
						(display (car l))
						(iter (cddr l)))))
			(iter front-ptr))
		(define (dispatch m)
			(cond ((eq? m 'empty?) empty-queue?)
				  ((eq? m 'front) front-queue)
				  ((eq? m 'rear) rear-queue)
				  ((eq? m 'front-insert!) front-insert-queue!)
				  ((eq? m 'rear-insert!) rear-insert-queue!)
				  ((eq? m 'front-delete!) front-delete-queue!)
				  ((eq? m 'rear-delete!) rear-delete-queue!)
				  ((eq? m 'print) print-queue)
				  (else (error "Undefined operation -- DEQUE" m))))
	dispatch))
(define q (make-queue))
((q 'front-insert!) 'a)
((q 'print))
((q 'front-insert!) 'b)
((q 'print))
((q 'front-insert!) 'c)
((q 'print))
((q 'rear-insert!) 'd)
((q 'print))
((q 'front-delete!))
((q 'print))
((q 'front-delete!))
((q 'print))
((q 'rear-delete!))
((q 'print))
((q 'rear-delete!))
((q 'print))