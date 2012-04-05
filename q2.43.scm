;Louisの実装は、最も内側のループにqueen-colsの呼び出しがある。そのため、
;n番目のqueen-colsを求めるためにn-1番目のqueen-colsをn回計算する必要がある。
;それに対し、元の実装はn番目のqueen-colsの計算するためにn-1番目のqueen-colsを１回計算すれば良い。
;
;queen-colsの引数|n n-1 n-2 n-3 ...       2       1 0
;呼び出し回数(L) |1   n n^2 n^3 ... n^(n-2) n^(n-1) n^n
;呼び出し回数(O) |1   1   1   1 ...       1       1 1
;
;n          1   2   3    4     5      6       7         8
;q         20  31  60  151   748   2444   15201     52812
;q(l)      14  34 160 1513 22636 372591 6680851 144374164
;--------------------------------------------------------
;q(l)/q   0.7 1.1 2.7 10.0  30.3  152.3   439.5      2734
;n!        1    2   6   24   120    720    5040
;
;T' = (n-1)!/2 * T
(load "./q2.42.scm")
(load "./runtime.scm")
(define (queens-l board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter
				(lambda (positions) (safe? k positions))
				(flatmap
					(lambda (new-row)
						(map (lambda (rest-of-queens)
								(adjoin-position new-row k rest-of-queens))
							(queen-cols (- k 1))))
					(enumerate-interval 1 board-size)
					))))
	(define empty-board '())
	; constructor
	(define (make-queen col row) (list col row))
	; accessor
	(define (row-queen queen-position) (cadr queen-position))
	(define (col-queen queen-position) (car queen-position))

	(define (adjoin-position new-row k rest-of-queens)
		(cons (make-queen k new-row) rest-of-queens))
	(define (safe? k positions)
		(define (get-queen-by-col col positions)
			(if (null? (car positions))
				(list 0 0)
				(if (= col (col-queen (car positions)))
					(car positions)
					(get-queen-by-col col (cdr positions)))))
		(let ((j (row-queen (get-queen-by-col k positions))))
			(define (inner-safe? position-list)
				(if (null? position-list)
					#t
					(let ((m (row-queen (car position-list)))
						  (n (col-queen (car position-list))))
						(and
							(if (= n k)
								#t
								(not
									(or
										(= m j)
										(= (+ (abs (- k n)) j) m)
										(= (- j (abs (- k n))) m))))
							(inner-safe? (cdr position-list))))))
			(if (= j 0)
				(error "out of range")
				(inner-safe? positions))))
	(queen-cols board-size)
)

(define (timed-queens q board-size)
	(define (report-time time)
		(display " => ")
		(display time))
	(define (start-timed-queens start-time)
		(and
			((lambda (x) #t) (q board-size))
			(report-time (- (runtime) start-time))))
	(newline)
	(display board-size)
	(start-timed-queens (runtime)))
((lambda (x) #t)
	(map (lambda (x) (timed-queens queens x))
		(enumerate-interval 1 8)))
((lambda (x) #t)
	(map (lambda (x) (timed-queens queens-l x))
		(enumerate-interval 1 8)))
