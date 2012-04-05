(load "./accumulate.scm")
(define fold-right accumulate)
(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest))
				(cdr rest))))
	(iter initial sequence))
;実行結果
;gosh> (fold-right / 1 (list 1 2 3))
;3/2
;gosh> (fold-left / 1 (list 1 2 3))
;1/6
;gosh> (fold-right list '() (list 1 2 3))
;(1 (2 (3 ())))
;gosh> (fold-left list '() (list 1 2 3))
;(((() 1) 2) 3)
;
;解答
;どのような並びに対しても同じ値を生じるためにopが満たすべき性質は交換則である
;例えば、加算は交換則が成り立つのでfold-leftとfold-rightが任意の並びに対して同じ結果を生じる
;gosh> (fold-right + 0 (list 1 2 3))
;6
;gosh> (fold-left + 0 (list 1 2 3))
;6
