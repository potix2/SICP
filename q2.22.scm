(define (square x)
	(* x x))
(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				  (cons (square (car things))
				  		answer))))
	(iter items '()))
;
; (25 16 9 4 1)が出力される
;(display (square-list (list 1 2 3 4 5)))

;理由:(cons (square (car things)) answer)
;を見るとiterの引数answerの先頭にthingsの先頭セルにsquareを適用し、追加している。
;従って、answerは'()から始まり先頭にセルが追加される

(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				  (cons answer (square (car things))))))
				  		
	(iter items '()))

;(((((() . 1) . 4) . 9) . 16) . 25)が出力される
(display (square-list (list 1 2 3 4 5)))

;理由：(cons answer (square (car things)))
;を見るとセルの左側にanswerリストを連結し、右側にthingsの先頭セルにsquareを適用した値を連結している
;従って、左側セルがリスト、右側セルがsquareが適用された値という形になる

