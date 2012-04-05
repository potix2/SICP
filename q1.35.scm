(load "./fixed-point.scm")
(print (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
