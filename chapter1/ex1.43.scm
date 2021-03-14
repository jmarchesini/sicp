(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (repeated f x)
  (if (= x 1)
      f
      (compose f (repeated f (- x 1)))))


;; 1 ]=> ((repeated inc 2) 5)
;; ;Value: 7

;; 1 ]=> ((repeated inc 8) 5)
;; ;Value: 13

;; 1 ]=> ((repeated square 2) 2)
;; ;Value: 16

;; 1 ]=> ((repeated square 3) 2)
;; ;Value: 256
