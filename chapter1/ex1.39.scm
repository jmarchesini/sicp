(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (frac (+ i 1))))))
  (frac 1))

(define pi
  (* 4 (atan 1.0)))

(define (square x)
  (* x x))

(define (tan-cf x k)
  (define (n k)
    (if (= k 1)
        x
        (- (square x))))
  (define (d k)
    (- (* 2 k) 1))  
  (cont-frac n d k))


;; 1 ]=> (tan-cf (/ pi 6) 13)
;; ;Value: .5773502691896257

;; 1 ]=> (tan (/ pi 6))
;; ;Value: .5773502691896256
