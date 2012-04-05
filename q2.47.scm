;impl1
(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2))
(define (origin-frame f)
	(car f))
(define (edge1-frame f)
	(cadr f))
(define (edge2-frame f)
	(cadr (cdr f)))

;impl2
;(define (make-frame origin edge1 edge2)
;	(cons origin (cons edge1 edge2)))
;(define (origin-frame f)
;	(car f))
;(define (edge1-frame f)
;	(cadr f))
;(define (edge2-frame f)
;	(cdr (cdr f)))
