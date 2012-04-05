(load "./q2.2.scm")
; 左上の点と横幅、高さを受け取り長方形の表現を返す
(define (make-rect1 top-left width height)
	(cons top-left
		(cons width height)))
; 長方形の幅を返す
(define (width-rect1 rect)
	(car (cdr rect)))
; 長方形の高さを返す
(define (height-rect1 rect)
	(cdr (cdr rect)))

; 対角の頂点を受け取り、長方形の表現を返す
(define (make-rect2 top-left right-bottom)
	(cons top-left right-bottom))
; 長方形の幅を返す
(define (width-rect2 rect)
	(abs (- (x-point (car rect)) (x-point (cdr rect)))))
; 長方形の高さを返す
(define (height-rect2 rect)
	(abs (- (y-point (car rect)) (y-point (cdr rect)))))


; perimeter-rectとarea-rectの実装では、
; width-rectとheight-rectを使うことでrectの実現方法が隠蔽される
(define (perimeter-rect rect)
	(+ (* (width-rect rect) 2) (* (height-rect rect) 2)))
(define (area-rect rect)
	(* (width-rect rect) (height-rect rect)))

; 表現１の実装をテスト
(define make-rect make-rect1)
(define width-rect width-rect1)
(define height-rect height-rect1)
(define (rect1-test)
	(let ((rect1 (make-rect (make-point 0 0) 10 20)))
		(and
			(= (perimeter-rect rect1) 60)
			(= (area-rect rect1) 200))))
(print (rect1-test))

; 表現２の実装をテスト
(define make-rect make-rect2)
(define width-rect width-rect2)
(define height-rect height-rect2)
(define (rect2-test)
	(let ((rect2 (make-rect (make-point 0 0) (make-point 10 20))))
		(and
			(= (perimeter-rect rect2) 60)
			(= (area-rect rect2) 200))))
(print (rect2-test))
