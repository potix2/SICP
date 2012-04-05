(load "./accumulate.scm")
(load "./filter.scm")
(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low 1) high))))
(define (unique-triplet n)
	(flatmap
		(lambda (i)
			(flatmap
				(lambda (j)
					(map
						(lambda (k) (list i j k))
							(enumerate-interval 1 (- j 1))))
				(enumerate-interval 1 (- i 1))))
		 (enumerate-interval 1 n)))
;(define (sum? pair)
;	(prime? (+ (car pair) (cadr pair))))
(define (calc-sum triplet)
	(+ (car triplet) (cadr triplet) (cadr (cdr triplet))))
(define (make-triplet-sum triplet)
	(list (car triplet) (cadr triplet) (cadr (cdr triplet)) (calc-sum triplet)))
(define (sum-triplet n s)
	(map make-triplet-sum
		(filter (lambda (x) (= (calc-sum x) s)) (unique-triplet n))))

;test
(define (sum-triplet-test)
	(define (test-sub s)
		(if (= s 3)
			#t
			(and
				(accumulate (lambda (x y) (and x y)) #t
					(map
						(lambda (x)
							(and (not (= (car x) (cadr x)))
								 (not (= (cadr x) (cadr (cdr x))))
								 (not (= (cadr (cdr x)) (car x)))
								 (= (+ (car x) (cadr x) (cadr (cdr x))) s)))
						(sum-triplet 100 s)))
				(test-sub (- s 1)))))
	(test-sub 50))
(display (sum-triplet-test))
(newline)
