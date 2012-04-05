; シンプソンの公式
; http://ja.wikipedia.org/wiki/%E3%82%B7%E3%83%B3%E3%83%97%E3%82%BD%E3%83%B3%E3%81%AE%E5%85%AC%E5%BC%8F

(load "./sum.scm")
(define (simpson f a b n)
	(define h (/ (- b a) n))
	(define (y k) (f (+ a (* k h))))
	(define (term i)
		(+
			(y (- (* 2 i) 2))
			(* 4 (y (- (* 2 i) 1)))
			(y (* 2 i))))
	(define (next i) (+ i 1))
	(/ (* h (sum term 1 next (/ n 2))) 3)
)
(define (cube x)
	(* x x x))
(display (simpson cube 0 1 10.0))
