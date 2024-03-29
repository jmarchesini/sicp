(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes start end)
   (if (even? start)
       (search-for-primes (+ start 1) end)
       (cond ((< start end)
              (timed-prime-test start)
              (search-for-primes (+ start 2) end)))))

(define (even? n)
   (= (remainder n 2) 0))

(define (runtime)
  (real-time-clock))
