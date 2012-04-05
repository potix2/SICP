(load "./interval.scm")
; 区間xと区間yの差、区間x-yの定義を考える。
; 区間x-yの下限は、区間xの下限と区間yの上限の差
; 区間x-yの上限は、区間xの上限と区間yの下限の差
;
; 上記の定義となる理由は、区間の定義に戻ればわかる
(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y))
				   (- (upper-bound x) (lower-bound y))))
; test
(define (sub-interval-test)
	(let ((sub-interval1 (sub-interval (make-interval 3 5) (make-interval 1 2))))
		(and
			(= (lower-bound sub-interval1) 1)
			(= (upper-bound sub-interval1) 4))))
(print (sub-interval-test))
