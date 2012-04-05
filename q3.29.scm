(define (or-gate a1 a2 output)
  (let ((a (make-wire))
        (b (meke-wire))
        (o (make-wire)))
    (inverter a1 a)
    (inverter a2 b)
    (and-gate a b o)
    (inverter o output)
    'ok))
;inverter-delay 2回
;and-delay 1回
;の遅延
