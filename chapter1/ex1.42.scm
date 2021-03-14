(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

;; 1 ]=> ((compose square inc) 2)
;; ;Value: 9

;; 1 ]=> ((compose inc square) 2)
;; ;Value: 5
