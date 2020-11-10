(define (pascal i j)
  (cond ((= 0 j) 1)
        ((= i j) 1)
        (else (+ (pascal (- i 1) j) (pascal (- i 1) (- j 1))))))
