(load "./q2.51.scm")
(load "./q2.45.scm")
(define (corner-split painter n)
	(if (= n 0)
		painter
		(let ((up (up-split painter (- n 1)))
				(right (right-split painter (- n 1))))
			(let ((top-left (beside up up))
				  (bottom-right (below right right))
				  (corner (corner-split painter (- n 1))))
				(beside (below painter top-left)
						(below bottom-right corner))))))
; original square-limit
;(define (square-limit painter n)
;	(let ((quarter (corner-split painter n)))
;		(let ((half (beside (flip-horiz quarter) quarter)))
;			(below (flip-vert half) half))))

;(b)
(define (right-split painter n)
	(if (= n 0)
		painter
		(beside painter (right-split painter (- n 1)))))
(define (up-split painter n)
	(if (= n 0)
		painter
		(below painter (up-split painter (- n 1)))))

;(c)
(define (square-of-four tl tr bl br)
	(lambda (painter)
		(let ((top (beside (tl painter) (tr painter)))
			  (bottom (beside (bl painter) (br painter))))
			(below bottom top))))
(define (identity painter)
	painter)
(define (square-limit painter n)
	(let ((f (square-of-four
				flip-horiz
				identity
				rotate180
				flip-vert)))
		(f (corner-split (flip-horiz painter) n))))
((square-limit wave 4) canvas-frame)
