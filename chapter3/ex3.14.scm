(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))


;; 1 ]=> (define v (list 'a 'b 'c 'd))
;; ;Value: v

;; 1 ]=> (define w (mystery v))
;; ;Value: w

;; 1 ]=> v
;; ;Value: (a)

;; 1 ]=> w
;; ;Value: (d c b a)
