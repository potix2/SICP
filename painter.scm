(load "./q2.47.scm")
(load "./q2.48.scm")
(load "./foreach.scm")
(define (frame-coord-map frame)
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect (scale-vect (xcor-vect v)
								  (edge1-frame frame))
					  (scale-vect (ycor-vect v)
					  			  (edge2-frame frame))))))
(define (draw-line v1 v2)
;draw-line: x1,y1,x2,y2
	(display (xcor-vect v1))
	(display ",")
	(display (ycor-vect v1))
	(display ",")
	(display (xcor-vect v2))
	(display ",")
	(display (ycor-vect v2))
	(newline))

(define (segments->painter segment-list)
	(lambda (frame)
		(for-each
			(lambda (segment)
				(draw-line
					((frame-coord-map frame) (start-segment segment))
					((frame-coord-map frame) (end-segment segment))))
			segment-list)))

; helper
(define (make-path l)
	(map
		(lambda (x) (make-segment (make-vect (car x) (cadr x)) (make-vect (cadr (cdr x)) (cadr (cdr (cdr x))))))
		l))

;  p.80
(define (transform-painter painter origin corner1 corner2)
	(lambda (frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
				(painter
					(make-frame new-origin
						(sub-vect (m corner1) new-origin)
						(sub-vect (m corner2) new-origin)))))))
(define (flip-vert painter)
	(transform-painter painter
		(make-vect 0.0 1.0)
		(make-vect 1.0 1.0)
		(make-vect 0.0 0.0)))
(define (shrink-to-upper-right painter)
	(transform-painter painter
		(make-vect 0.5 0.5)
		(make-vect 1.0 0.5)
		(make-vect 0.5 1.0)))
(define (rotate90 painter)
	(transform-painter painter
		(make-vect 1.0 0.0)
		(make-vect 1.0 1.0)
		(make-vect 0.0 0.0)))
(define (squash-inwards painter)
	(transform-painter painter
		(make-vect 0.0 0.0)
		(make-vect 0.65 0.35)
		(make-vect 0.35 0.65)))
(define (beside painter1 painter2)
	(let ((split-point (make-vect 0.5 0.0)))
		(let ((paint-left
				(transform-painter painter1
								   (make-vect 0.0 0.0)
								   split-point
								   (make-vect 0.0 1.0)))
			  (paint-right
			  	(transform-painter painter2
								   split-point
								   (make-vect 1.0 0.0)
								   (make-vect 0.5 1.0))))
			(lambda (frame)
				(paint-left frame)
				(paint-right frame)))))
