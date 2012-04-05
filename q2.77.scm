(load "./calculus.scm")
(install-rectangular-package)
(install-polar-package)
(install-complex-package)

; scheme-number test
;(install-scheme-number-package)
;(display (add (make-scheme-number 1) (make-scheme-number -2)))
;(display (sub (make-scheme-number 1) (make-scheme-number -2)))
;(display (mul (make-scheme-number 1) (make-scheme-number -2)))
;(display (div (make-scheme-number 1) (make-scheme-number -2)))

; rational test
;(install-rational-package)
;(display (add (make-rational 1 2) (make-rational 2 3)))
;(display (sub (make-rational 1 2) (make-rational 2 3)))
;(display (mul (make-rational 1 2) (make-rational 2 3)))
;(display (div (make-rational 1 2) (make-rational 2 3)))

;解答
;どうして動くのか？
;(define (magnitude z) (apply-generic 'magnitude z))
;という定義があり、complex型のオブジェクトに対し
;magnitudeを呼び出すと、Alyssaが追加した定義によって再度apply-generic
;が呼び出される。この時、complexタグは剥がされておりrectagularのmagnitudeが呼ばれる
;
;apply-genericは２回呼ばれる。以下、トレース結果。
;gosh> (magnitude (make-complex-from-mag-ang 10 90)))
;called apply-generic: op=magnitude args=((complex polar 10 . 90))
;called apply-generic: op=magnitude args=((polar 10 . 90))
;10
;gosh> (magnitude (make-complex-from-real-imag 10 20))
;called apply-generic: op=magnitude args=((complex rectangular 10 . 20))
;called apply-generic: op=magnitude args=((rectangular 10 . 20))
;22.360679774997898
