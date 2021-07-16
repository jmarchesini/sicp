(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (fast-mult a (half b))))
        (else (+ a (fast-mult a (- b 1))))))

(define (even? n)
  (= (remainder n 2) 0))
     
(define (double x)
  (+ x x))

(define (half x)
  (/ x 2))

