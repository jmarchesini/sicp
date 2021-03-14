(define (iterative-improve good-enough? improve)
  (define (iter-imp guess)
    (if (good-enough? guess)
        guess
        (iter-imp (improve guess))))
  iter-imp)

(define (sqrt x)
  ((iterative-improve (lambda (guess)
                        (< (abs (- (square guess) x))
                           0.001))
                      (lambda (guess)
                        (average guess (/ x guess))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
                        (< (abs (- guess (f guess)))
                           0.000001))
                      (lambda (guess)
                        (f guess)))
   1.0))


;; 1 ]=> (sqrt 4)
;; ;Value: 2.0000000929222947

;; 1 ]=> (sqrt 49)
;; ;Value: 7.000000141269659

;; 1 ]=> (sqrt 1024)
;; ;Value: 32.0000071648159

;; 1 ]=> (fixed-point (lambda (x) (+ 1 (/ 1 x))) 13.0)
;; ;Value: 1.618034447821682
