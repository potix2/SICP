(define acc (make-account 100))
(parallel-execute (lambda () ((acc 'withdraw) (/ (acc 'balance) 2)))
				  (lambda () ((acc 'withdraw) 60)))
;賛成しない
;balanceへのアクセスを直列化しなかったとしても、実際にbalanceに格納されている値と
;呼び出し元が受け取る値に不整合を生じる事はない
