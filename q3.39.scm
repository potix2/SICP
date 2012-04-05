;case 1:
; x => 10
;(s (lambda () (set! x (+ x 1))))
; x => 11
;(lambda () (set! x ((s (lambda () (* x x))))))
; x => 121
;
;case 2:
; x => 10
;(lambda () (set! x ((s (lambda () (* x x))))))
; x => 100
;(s (lambda () (set! x (+ x 1))))
; x => 101
