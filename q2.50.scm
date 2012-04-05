(load "./q2.49.scm")
(define (flip-horiz painter)
	(transform-painter painter
		(make-vect 1.0 0.0)
		(make-vect 0.0 0.0)
		(make-vect 1.0 1.0)))
;((flip-horiz wave) canvas-frame)

(define (rotate180 painter)
	(transform-painter painter
		(make-vect 1.0 1.0)
		(make-vect 0 1.0)
		(make-vect 1.0 0)))
;((rotate180 wave) canvas-frame)

(define (rotate270 painter)
	(transform-painter painter
		(make-vect 0 1.0)
		(make-vect 0 0)
		(make-vect 1.0 1.0)))
;((rotate270 wave) canvas-frame)
