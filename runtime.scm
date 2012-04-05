(define (runtime) 
        (use srfi-11)
		        (let-values (((a b) (sys-gettimeofday)))
				                (+ (* a 1000000) b)))
