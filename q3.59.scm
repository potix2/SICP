(use util.stream)
;a)
(define (integrate-series a)
	(stream-map / s integers))

;b)
(define cosine-series
	(cons-stream 1
		(stream-map - (integrate-series sine-series)))) 
(define sine-series
	(cons-stream 0 (integrate-series cosine-series)))
