(define (put-get-gen)
;; キーが２つ、値が１つ入ったレコード構造の操作
(define (make-record key1 key2 value)
	(list key1 key2 value))
(define (key1-record rec) (car rec))
(define (key2-record rec) (cadr rec))
(define (value-record rec) (caddr rec))
(define (match-record? rec key1 key2)
	(and (equal? (key1-record rec) key1)
		 (equal? (key2-record rec) key2))) ;; '(rectangular) みたいなタグがありうるので eq? では駄目。
	;; 表データ。put, get が共通で利用。クロージャ。
	(define table '())
	;; 表にまつわる3つの関数のリストを返す
	(list
	;; put <op> <type> <item> - 表の適切な箇所に item をセット
	(lambda (op type item)
		(define (delete-from tbl key1 key2 result)
			(if (null? tbl)
				result
				(let ((rec (car tbl)))
					(if (match-record? rec key1 key2)
						(delete-from (cdr tbl) key1 key2 result)
						(delete-from (cdr tbl) key1 key2 (cons (car tbl) result))
						))))
		(let ((new-rec (make-record op type item)))
			(set! table (cons new-rec (delete-from table op type '())))
			; ここは set! を使うしかないかな。→ see §3.1.1
			new-rec))
	;; get <op> <type> - 表の適切な箇所から item をゲット
	(lambda (op type)
		(define (select-from tbl key1 key2)
			(if (null? tbl)
				#f    ;'() だと、ifで判定している apply-generic が困る
				(let ((rec (car tbl)))
					(if (match-record? rec key1 key2)
						(value-record rec)
						(select-from (cdr tbl) key1 key2))))
		)
		(select-from table op type))
	;; table - put, get が使っている表を得る手続き
	(lambda () table)
	))
