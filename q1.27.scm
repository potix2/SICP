(load "./fast-prime.scm")

;定義) nがcarmichael数 => for every a (1 <= a <= n) => a^n ≡ a (mod n)
;
(define (carmichael? n)
	(define (inner a n)
		(cond
			((= a 0) #t)
			((= (expmod (- a 1) n n) (- a 1)) (inner (- a 1) n))
			(else #f)))
	(inner (- n 1) n))
(display (carmichael? 561))
(display (carmichael? 1105))
(display (carmichael? 1729))
(display (carmichael? 2465))
(display (carmichael? 2821))
(display (carmichael? 6601))
