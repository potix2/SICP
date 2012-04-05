;(a)
; ２つの結果は同じ結果を生じる
; 
; 7--+--9--+--11
;    |
;    +--3--+--5
;          |
;          +--1
;
; tree->list-1 => 1 3 5 7 9 11
; tree->list-2 => 1 3 5 7 9 11
;
; 3--+--7--+--9--+--11
;    |     | 
;    +--1  +--5
;
; tree->list-1 => 1 3 5 7 9 11
; tree->list-2 => 1 3 5 7 9 11
;
; 5--+--9--+--11
;    |     |
;    |     +--7
;    |
;    +--3--+
;          |
;          +--1
;
; tree->list-1 => 1 3 5 7 9 11
; tree->list-2 => 1 3 5 7 9 11
;
(load "./tree.scm")
(define (tree->list-1 tree)
	(if (null? tree)
		'()
		(append (tree->list-1 (left-branch tree))
				(cons (entry tree)
					  (tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
	(define (copy-to-list tree result-list)
		(if (null? tree)
			result-list
			(copy-to-list (left-branch tree)
						  (cons (entry tree)
						  		(copy-to-list (right-branch tree)
											  result-list)))))
	(copy-to-list tree '()))
(define tree1 (make-tree 7 (make-tree 3 (make-tree 1 '() '()) (make-tree 5 '() '()))
						   (make-tree 9 '() (make-tree 11 '() '()))))
(define tree2 (make-tree 3 (make-tree 1 '() '())
						   (make-tree 7 (make-tree 5 '() '())
						   				(make-tree 9 '() (make-tree 11 '() '())))))
(define tree3 (make-tree 5 (make-tree 3 (make-tree 1 '() '()) '())
						   (make-tree 9 (make-tree 7 '() '())
						   				(make-tree 11 '() '()))))

; test(a)
;(display "tree->list-1")
;(newline)
;(display (tree->list-1 tree1))
;(newline)
;(display (tree->list-1 tree2))
;(newline)
;(display (tree->list-1 tree3))
;(newline)

;(display "tree->list-2")
;(newline)
;(display (tree->list-2 tree1))
;(newline)
;(display (tree->list-2 tree2))
;(newline)
;(display (tree->list-2 tree3))
;(newline)

;(b)
;再帰の呼び出し回数が同じになるので、ステップ数の増加の速度は同じ
;パフォーマンスを考えるとappendを使っているtree->list-1の方が遅くなる
