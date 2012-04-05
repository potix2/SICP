(use srfi-1)
(print
(map
	(lambda (x) (cond
					((= (modulo x 15) 0) "FizzBuzz")
					((= (modulo x 5) 0) "Buzz")
					((= (modulo x 3) 0) "Fizz")
					(else x)))
	(iota 100 1))
)
