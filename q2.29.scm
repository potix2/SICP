(define (make-mobile left right)
	(list left right))
(define (make-branch length structure)
	(list length structure))

;answer(a)
(define (left-branch m) (car m))
(define (right-branch m) (car (cdr m)))
(define (branch-length b) (car b))
(define (branch-structure b) (car (cdr b)))

;test(a)
(define (mobile-test-a)
	(and
		(= (left-branch (make-mobile 1 2)) 1)
		(= (right-branch (make-mobile 1 2)) 2)
		(= (branch-length (make-branch 1 2)) 1)
		(= (branch-structure (make-branch 1 2)) 2)))
(display "mobile-test-a => ")
(display (mobile-test-a))
(newline)

;answer(b)
(define (total-weight m)
	(if (pair? m)
		(let ((ls (branch-structure (left-branch m)))
			  (rs (branch-structure (right-branch m))))
			(+
				(if (pair? ls)
					(total-weight ls)
					ls)
				(if (pair? rs)
					(total-weight rs)
					rs)))
		m))

;test(b)
(define (mobile-test-b)
	(let ((m1 (make-mobile (make-branch 1 1) (make-branch 2 2))))
		(let 
		  	((m2 (make-mobile (make-branch 3 m1) (make-branch 4 4))))
			(and
				(= (total-weight 1) 1)
				(= (total-weight m1) 3)
				(= (total-weight m2) 7)))))
(display "mobile-test-b => ")
(display (mobile-test-b))
(newline)

;answer(c)
; (balanced? 1) => #t
; (balanced?  (make-mobile (make-branch 1 1) (make-branch 1 1))) => #t
; (balanced?  (make-mobile (make-branch 1 2) (make-branch 1 1))) => #f
; (balanced?  (make-mobile (make-branch 1 2) (make-branch 2 1))) => #t
(define (balanced? m)
	(if (pair? m)
		(let ((lb (left-branch m))
			  (rb (right-branch m)))
			(and
				(= (* (branch-length lb) (total-weight (branch-structure lb)))
				   (* (branch-length rb) (total-weight (branch-structure rb))))
				(balanced? (branch-structure lb))
				(balanced? (branch-structure rb))))
		#t))

;test(c)
(define (mobile-test-c)
	(let ((m1 (make-mobile (make-branch 1 1) (make-branch 2 2)))
		  (m2 (make-mobile (make-branch 1 1) (make-branch 1 1)))
		  (m3 (make-mobile (make-branch 1 2) (make-branch 1 2)))
		  (m4 (make-mobile (make-branch 1 2) (make-branch 2 1))))
		(let 
		  	((m5 (make-mobile (make-branch 3 m2) (make-branch 2 3))))
			(and
				(balanced? 1)
				(not (balanced? m1))
				(balanced? m2)
				(balanced? m3)
				(balanced? m4)
				(balanced? m5)
			))))
(display "mobile-test-c => ")
(display (mobile-test-c))
(newline)

;answer(d)
;修正する必要があるのは、right-branch、branch-structureのみである
;以下では、モービルの新しい表現によって上記２つの関数の修正だけで、問題a,b,cのテストに成功することを示す
(define (make-mobile left right)
	(cons left right))
(define (right-branch m)
	(cdr m))
(define (make-branch length structure)
	(cons length structure))
(define (branch-structure b)
	(cdr b))

;test(d)
(define (mobile-test-d)
	(and
		(mobile-test-a)
		(mobile-test-b)
		(mobile-test-c)))
(display "mobile-test-d => ")
(display (mobile-test-d))
(newline)
