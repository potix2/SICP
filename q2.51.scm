(load "./q2.50.scm")
(define (below painter1 painter2)
	(let ((split-point (make-vect 0.0 0.5)))
		(let ((paint-top
				(transform-painter painter2
								   (make-vect 0.0 0.0)
								   (make-vect 1.0 0.0)
								   split-point))
			  (paint-bottom
			  	(transform-painter painter1
								   split-point
								   (make-vect 1 0.5)
								   (make-vect 0 1.0))))
			(lambda (frame)
				(paint-top frame)
				(paint-bottom frame)))))
(define (below painter1 painter2)
	(lambda (frame)
		((rotate90 (beside (rotate270 painter1) (rotate270 painter2))) frame)))
;((below x-painter wave) canvas-frame)
;((below wave wave) canvas-frame)
