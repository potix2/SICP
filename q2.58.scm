(load "./deriv.scm")
;(a) derivの実装は変更せずに、選択子、構成子を修正すれば良い
(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		  ((=number? a2 0) a1)
		  ((and (number? a1) (number? a2) (+ a1 a2)))
		  (else (list a1 '+ a2))))
(define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
		  ((=number? m1 1) m2)
		  ((=number? m2 1) m1)
		  ((and (number? m1) (number? m2)) (* m1 m2))
		  (else (list m1 '* m2))))
(define (sum? x)
	(and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s) (caddr s))
(define (product? x)
	(and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))
(define (=number? exp num)
	(and (number? exp) (= exp num)))

;(b)
;演算子の優先順位をもとに曖昧ではない構文木を構成してからでないと
;述語、選択子、構成子を適用できない。構文解析のフェーズが必要である。
;選択子、述語、構成子のレベルで対応することも現実にはできるのかもしれないが、
;成層設計という観点からみて不適切。
