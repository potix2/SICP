(load "./stream.scm")
(define (stream-map proc . argstreams)
	(if (stream-null? (car argstreams))
		the-empty-stream
		(cons-stream
		 (apply proc (map stream-car argstreams))
		 (apply stream-map
		 		(cons proc (map stream-cdr argstreams))))))

(define (test)
	(define (check-for-each r e)
		(if (stream-null? r)
			#t
			(and (eq? (stream-car r) (stream-car e)) (check-for-each (stream-cdr r) (stream-cdr e)))))
	(let ((result (stream-map + 
				(stream-enumerate-interval 0 3)
				(stream-enumerate-interval 10 13)
				(stream-enumerate-interval 20 23)))
		  (expect (cons-stream 30 (cons-stream 33 (cons-stream 36 (cons-stream 39 the-empty-stream))))))
		 (if (check-for-each result expect) 'ok 'ng)))
(display (test))
