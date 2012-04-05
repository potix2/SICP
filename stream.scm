(use util.stream)
;memo-proc
;(define (memo-proc proc)
;	(let ((already-run? #f) (result #f))
;		(lambda ()
;			(if (not already-run?)
;				(begin (set! result (proc))
;					   (set! already-run? #t)
;					   result)
;				result))))
;(define (delay exp)
;	(memo-proc (lambda () exp)))
;	(lambda () exp))
;(define (force delayed-object)
;	(delayed-object))

;stream-car cons-stream stream-cdr
(define (cons-stream a b)
	(stream-cons a b))
;	(cons a (delay b)))
;(define (stream-car stream) (car stream))
;(define (stream-cdr stream) (force (cdr stream)))
;(define (stream-ref s n)
;	(if (eq? n 0)
;		(stream-car s)
;		(stream-ref (stream-cdr s) (- n 1))))
;(define (stream-null? stream) (null? stream))
(define the-empty-stream stream-null)

;utils
;(define (stream-for-each proc s)
;	(if (stream-null? s)
;		'done
;		(begin (proc (stream-car s))
;			   (stream-for-each proc (stream-cdr s)))))

(define (display-line x)
	(newline)
	(display x))

(define (display-stream s)
	(stream-for-each display-line s))

(define (stream-enumerate-interval low high)
	(if (> low high)
		the-empty-stream
		(cons-stream
		 low
		 (stream-enumerate-interval (+ low 1) high))))

;(define (stream-map proc s)
;	(if (stream-null? s)
;		the-empty-stream
;		(cons-stream (proc (stream-car s))
;					 (stream-map proc (stream-cdr s)))))

;(define (stream-map proc . argstreams)
;	(if (stream-null? (car argstreams))
;		the-empty-stream
;		(cons-stream
;		 (apply proc (map stream-car argstreams))
;		 (apply stream-map
;		 		(cons proc (map stream-cdr argstreams))))))

;(define (stream-filter pred stream)
;	(cond ((stream-null? stream) the-empty-stream)
;		  ((pred (stream-car stream))
;		   (cons-stream (stream-car stream)
;		   				(stream-filter pred
;									   (stream-cdr stream))))
;		  (else (stream-filter pred (stream-cdr stream)))))

;そのままでは動かないので理解できるまで放置
(define ones (stream-cons 1 ones))

(define (add-streams s1 s2)
	(stream-map + s1 s2))

(define integers (stream-cons 1 (add-streams ones integers)))

;test
(define (stream-test)
	(define (empty-test) (and (stream-null? the-empty-stream)
							  (not (stream-null? 'a))))
	(define (cons-test)
		(let ((s (cons-stream 'a (cons-stream 'b the-empty-stream))))
			 (and (eq? (stream-car s) 'a)
			 	  (eq? (stream-car (stream-cdr s)) 'b))))
	(if (and (empty-test) (cons-test))
		'ok
		'ng))
