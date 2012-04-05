(load "./painter.scm")
(define frame-painter (segments->painter
		(make-path
			(list (list 0 0 1 0)
				  (list 1 0 1 1)
				  (list 1 1 0 1)
				  (list 0 1 0 0)))))
(define x-painter (segments->painter
		(make-path
			(list (list 0 0 1 1)
				  (list 1 0 0 1)))))
(define lozenge-painter (segments->painter
		(make-path
			(list (list 0.5   0   1 0.5)
				  (list   1 0.5 0.5   1)
				  (list 0.5   1   0 0.5)
				  (list   0 0.5 0.5   0)))))
(define wave (segments->painter
		(make-path
			(list (list    0 0.83 0.18 0.7)
				  (list 0.18 0.7  0.26 0.75)
				  (list 0.26 0.75  0.4 0.75)
				  (list  0.4 0.75 0.35 0.87)
				  (list 0.35 0.87  0.4    1)

				  (list  0.6    1 0.65 0.87)
				  (list 0.65 0.87  0.6 0.75)
				  (list  0.6 0.75 0.76 0.75)
				  (list 0.76 0.75    1 0.25)

				  (list    0 0.74  0.2 0.46)
				  (list  0.2 0.46 0.26 0.65)
				  (list 0.26 0.65 0.38  0.5)
				  (list 0.38  0.5 0.28    0)

				  (list  0.4    0  0.5  0.2)
				  (list  0.5  0.2  0.6    0)

				  (list 0.75    0 0.65  0.5)
				  (list 0.65  0.5    1  0.1)

				  ;q2.52
				  (list 0.42 0.80 0.50 0.77)
				  (list 0.50 0.77 0.58 0.80)
))))
;output frame-painter
(define canvas-frame (make-frame (make-vect 0 0) (make-vect 400 0) (make-vect 0 400)))
;(display "frame-painter =>")
;(newline)
;(frame-painter canvas-frame)
;(display "x-painter =>")
;(newline)
;(x-painter canvas-frame)
;(display "lozenge-painter =>")
;(newline)
;(lozenge-painter canvas-frame)
;(display "wave =>")
;(newline)
(wave canvas-frame)
