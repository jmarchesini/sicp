(define (make-accumulator a)
  (let ((sum a))
    (lambda (acc)
      (set! sum (+ sum acc))
      sum)))


;; 1 ]=> (define A (make-accumulator 5))
;; ;Value: a

;; 1 ]=> (A 10)
;; ;Value: 15

;; 1 ]=> (A 10)
;; ;Value: 25
