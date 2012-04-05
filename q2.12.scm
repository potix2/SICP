(load "./fixed-point.scm") ; for close-enough?
(load "./interval.scm")
(define (make-center-percent center percent)
	(make-center-width center (* center (/ percent 100))))
(define (percent-interval i)
	(* (/ (width-interval i) (center-interval i)) 100))

(define (make-center-percent-test)
	(and
		(close-enough? (percent-interval (make-center-percent 10 1.2)) 1.2)
		(close-enough? (percent-interval (make-center-percent 10 0)) 0)))
(display (make-center-percent-test))
(newline)
