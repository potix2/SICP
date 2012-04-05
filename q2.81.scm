(load "./calculus.scm")
;(a)
;apply-genericが再帰的に呼び出され、停止しなくなる
;
;(b)
;Louisの主張は正しくない。(complex->complex)の変換をしたとしても、
;引数の組み合わせは(complex complex)なので再帰呼び出しで停止しなくなる。
;また、apply-genericは同じ型の引数の場合、
;強制型変換が行われないようにしないと動かない。
;
;(c)
(define (exp x y) (apply-generic 'exp x y))
(define (install-exp-package)
	(put 'exp '(scheme-number scheme-number)
		(lambda (x y) (attach-tag 'scheme-number (expt x y)))))
(install-scheme-number-package)
(install-rectangular-package)
(install-polar-package)
(install-complex-package)
(install-exp-package)
