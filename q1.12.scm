; pascal(n, m)をPascal三角形のn段目、m番の値を返す関数と定義する
; n,mが三角形上の有効な値をとらない場合、関数は0を返す
;
;pascal(n, m) = pascal(n-1, m-1) + pascal(n-1, m) 
;
(define (pascal n m)
	(cond ((and (= n 1) (= m 1)) 1)
		((or (< m 1) (> m n)) 0)
		(else (+ (pascal (- n 1) (- m 1)) (pascal (- n 1) m)))
	)
)
