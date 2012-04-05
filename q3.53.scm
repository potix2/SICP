(load "./stream.scm")
;1 2 4 8 16 32 ...
;2^n を表すストリーム
(define s (cons-stream 1 (add-stream s s)))
(display (stream-ref 3))
