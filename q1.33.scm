;(define (filtered-accumulate filter combiner null-value term a next b)
;	(define (iter a result)
;		(cond
;			((> a b) result)
;			((filter a)
;				(iter (next a) (combiner result (term a))))
;			(else
;				(iter (next a) result))
;		)
;	)
;	(iter a null-value)
;)

(define (filtered-accumulate filter combiner null-value term a next b)
	(cond
		((> a b) null-value)
		((filter a)
			(filtered-accumulate
				filter combiner (combiner null-value (term a)) term (next a) next b))
		(else
			(filtered-accumulate
				filter combiner null-value term (next a) next b))
	)
)


(define (prime? n)
	(= n (smallest-divisor n)))

(define (smallest-divisor n)
   (find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (identity x) x)

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))
	)
)

; 
(define (ipss a b)
	(filtered-accumulate prime? + 0 square a inc b))
(define (comprime-products n)
	(define (comprime m) (= (gcd n m) 1))
	(filtered-accumulate comprime * 1 identity 1 inc (- n 1)))
