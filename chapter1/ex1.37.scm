(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (frac (+ i 1))))))
  (frac 1))


(define (cont-frac-iter n d k)
   (define (frac-iter i result)
       (if (= i 0)
           result
           (frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
   (frac-iter (- k 1) (/ (n k) (d k))))


;; 1 ]=> (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 13)
;; ;Value: .6180371352785146

;; 1 ]=> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 13)
;; ;Value: .6180371352785146
