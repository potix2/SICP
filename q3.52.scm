(load "./stream.scm")
(define sum 0)
;(define (even? x)
;	(cond ((= x 0) #t)
;		  ((= x 1) #f)
;		  (else (even? (- x 2)))))
(define (accum x)
	(set! sum (+ x sum))
	sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
						 seq))
(display (stream-ref y 7))
(newline)
(display-stream z)
;sum => 210
(display sum)
;memo-procによる最適化を行った場合、stream-refやdisplay-streamの呼び出しによって、
;stream-filterやstream-map、stream-enumerate-intervalの呼び出しまでが毎回、行われる。
