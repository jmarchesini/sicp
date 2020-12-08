(define (square x)
   (* x x))

(define (even? n)
   (= (remainder n 2) 0))

(define (expmod base exp m)
   (cond ((= exp 0) 1)
         ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
         (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (congruent? n a)
  (= (expmod a n n) a))

(define (passes-fermat? n)
  (define (try-it a)
    (cond ((= a 1) #t)
          ((not (congruent? n a)) #f)
          (else (try-it (- a 1)))))
  (try-it (- n 1)))
