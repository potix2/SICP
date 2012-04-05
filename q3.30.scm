(define (ripple-carry-adder a-list b-list c0 s-list)
  (define (iter a b c s)
    (let ((cout (make-wire)))
      (full-adder (car a) (car b) c (car s) cout)
      (iter (cdr a) (cdr b) cout (cdr s))))
  (iter a-list b-list c0 s))
;half-adder => 2and + inverter
;full-adder => 2half-adder + or => 4and + 2inverter + or
;ans) n * (4and + 2inverter + or)
