(define (subsets s)
	(if (null? s)
		(list '())
		(let ((rest (subsets (cdr s))))
			(append rest (map (lambda (x) (cons (car s) x)) rest)))))
;test
(define (subsets-test)
	(and
		(equal? (subsets '()) (list '()))
		(equal? (subsets (list 1)) (list '() (list 1)))
		(equal? (subsets (list 1 2 3))
				(list '() (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)))))
(display (subsets-test))
(newline)

;解答
;はじめに、リストで集合を表現した場合、重複のない二つのリストに対するappend関数の適用は
;和集合を求める演算と等しい。
;以上を踏まえて、リストで表現された集合のベキ集合を求める関数subsetsの定義が
;上記の定義で正しいことを説明する
;
;まず、集合Sのべき集合をP(S)とおき、
;S'={x}∪S(ただし、{x}∩S={})で定義される集合S'のベキ集合P(S')を考える
;ここで、
; X={x|x∈{x}∪A, A∈P(S)}・・・(1)
;で定義される集合Xをおくと
; P(S')=P(S)∪X・・・(2)
;となり、P(S')はS'のベキ集合である。(本当はここの証明が必要？自明な気もする・・・)
;また、ベキ集合を求める関数subsetsの定義と上記式を比較すると、
; x    => (car s)
; P(S) => rest
;である。ここで、
; (map (lambda (x) (cons (car s) x)) rest)
;は、restのすべての要素(Sのすべての部分集合)にxを加えた集合を要素とする集合を生成する。
;これは集合Xの定義に他ならない。
;したがって、
; (append rest (map (lambda (x) (cons (car s) x)) rest))
;は、P(S)と集合Xの和集合であるから、(2)の定義と等しくS'のベキ集合であると言える
