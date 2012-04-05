;(a)
;partial-treeは引数で受け取った要素の最初の半分で左の枝を構成し、中央の値を節に割り当て、
;残り半分を右側の枝にする。要素数が偶数(2n)の場合は、n番目の要素が節に割り当てられる。
;
; 5--+--9--+--11 
;    |     |
;    |     +--7
;    |
;    +--1--+--3
;
(load "./tree.scm")
(define (list->tree elements)
	(car (partial-tree elements (length elements))))
(define (partial-tree elts n)
	(if (= n 0)
		(cons '() elts)
		(let ((left-size (quotient (- n 1) 2)))
			(let ((left-result (partial-tree elts left-size)))
				(let ((left-tree (car left-result))
					  (non-left-elts (cdr left-result))
					  (right-size (- n (+ left-size 1))))
					(let ((this-entry (car non-left-elts))
						  (right-result (partial-tree (cdr non-left-elts)
						  							  right-size)))
						(let ((right-tree (car right-result))
							  (remaining-elts (cdr right-result)))
							(cons (make-tree this-entry left-tree right-tree)
								remaining-elts))))))))

;test
;(display (list->tree '(1 3 5 7 9 11)))
;(b)
;O(n)の増加
