; 計算過程は、ノート参照
; (a b) = Tpq (a b) とすると
; Tpq = (p+q q q p)
; Tpq * Tpq = Tp'q' 以上を計算すると係数の比較から
; p' = p^2 + q^2
; q' = 2pq + q^2
(define (fib n)
	(fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
	(cond	((= count 0 ) b)
			((even? count)
				(fib-iter
					a
					b
					(+ (square p) (square q))
					(+ (* 2 p q) (square q))
					(/ count 2)))
			(else (fib-iter (+ (* b q) (* a q) (* q p))
							(+ (* b p) (* a q))
							p
							q
							(- count 1)))))

(define (even? n) (= (remainder n 2) 0))
(define (square x) (* x x))
