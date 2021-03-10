(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (frac (+ i 1))))))
  (frac 1))

(define (d i)
  (if (not (= 0 (remainder (+ i 1) 3)))
      1
      (* 2 (/ (+ i 1) 3))))

(define (n i) 1.0)
