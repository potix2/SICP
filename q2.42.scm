(load "./accumulate.scm")
(load "./filter.scm")
(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low 1) high))))
(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter
				(lambda (positions) (safe? k positions))
				(flatmap
					(lambda (rest-of-queens)
						(map (lambda (new-row)
								(adjoin-position new-row k rest-of-queens))
							(enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
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
;test
	(define (adjoin-position-test)
		(and
			(equal? (adjoin-position 1 1 '()) (list (list 1 1)))
			(equal? (adjoin-position 2 2 (list (list 1 1))) (list (list 2 2) (list 1 1)))
		))
	(define (safe-test)
		(define safe-list (list (list 1 3) (list 2 1) (list 3 4) (list 4 2)))
		(and
			(safe? 1 (list (list 1 1)))
			(not (safe? 1 (list (list 2 1) (list 1 1))))
			(not (safe? 2 (list (list 2 1) (list 1 1))))
			(safe? 1 safe-list)
			(safe? 2 safe-list)
			(safe? 3 safe-list)
			(safe? 4 safe-list)
		))
	(define (safe-test-all)
		(define (safe-test-all-inner positions)
			(accumulate
				(lambda (x y) (and x y))
				#t
				(map
					(lambda (x) (safe? x positions))
					(enumerate-interval 1 board-size))))
		(accumulate
			(lambda (x y) (and x y))
			#t
			(map
				(lambda (result) (safe-test-all-inner result))
				(queen-cols board-size))))
;	(display
;		(and (adjoin-position-test)
;			 (safe-test)))
;	(display
;		(and (safe-test-all)))
;	(newline)
	(queen-cols board-size)
)
