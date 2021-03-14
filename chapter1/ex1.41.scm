(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

;; 1 ]=> (((double (double double)) inc) 5)
;; ;Value: 21
