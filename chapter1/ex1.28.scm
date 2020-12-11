(define (square-and-check x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1)))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (even? x)
  (= (remainder x 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (square-and-check (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 2)))))
