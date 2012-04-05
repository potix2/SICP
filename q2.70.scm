(load "./q2.69.scm")
(define rock-pairs '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))
(define rock-message '(
	GET A JOB
	SHA NA NA NA NA NA NA NA NA
	GET A JOB
	SHA NA NA NA NA NA NA NA NA
	WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
	SHA BOOM))
(display (length (encode rock-message (generate-huffman-tree rock-pairs))))
;解答: 84bit
;8記号の固定長符号を使った場合は、288bit必要
;(* 8 (length rock-message))
