(load "./constraint.scm")
(define (squarer a b)
	(multiplier a a b))
(define A (make-connector))
(define B (make-connector))
(squarer A B)
(probe "Input A: " A)
(probe "Output B: " B)
(set-value! B 4 'user)

;問題点：bに値を代入しても、aの値が決定できない。
;理由は、multiplierの値が確定するための制約条件を満たせないから
