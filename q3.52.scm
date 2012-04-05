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
;memo-proc$B$K$h$k:GE,2=$r9T$C$?>l9g!"(Bstream-ref$B$d(Bdisplay-stream$B$N8F$S=P$7$K$h$C$F!"(B
;stream-filter$B$d(Bstream-map$B!"(Bstream-enumerate-interval$B$N8F$S=P$7$^$G$,Kh2s!"9T$o$l$k!#(B
