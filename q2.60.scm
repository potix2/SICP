(load "./set.scm")
; adjoin-setとunion-setの実装のみ変更となる
(define (adjoin-set x set)
	(cons x set))
(define (union-set set1 set2)
	(append set1 set2))

;union-setとadjoin-setを高頻度で呼び出し、intersection-setとelement-of-setの呼び出し回数が少ない場合
;に限って利用価値がある。残念ながらそういった応用は少ないことが予想される。
;
;この表現を用いる利点はunion-setとadjoin-setが要素数に依存せず定数時間で行えることである
;しかし、element-of-setとintersection-setはunion-setとunion-setの呼び出し回数に比例して遅くなる
