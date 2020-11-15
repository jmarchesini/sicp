(define (mult x y)
  (mult-iter 0 x y))

(define (mult-iter a x y)
  (cond ((= y 0) a)
        ((even? y) (mult-iter a (double x) (half y)))
        (else (mult-iter (+ a x) x (- y 1)))))

(define (even? n)
  (= (remainder n 2) 0))
     
(define (double x)
  (+ x x))

(define (half x)
  (/ x 2))
