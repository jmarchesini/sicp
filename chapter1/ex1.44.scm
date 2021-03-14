(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f x)
  (if (= x 1)
      f
      (compose f (repeated f (- x 1)))))

(define (smooth f dx)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx)))
       3)))

(define (smooth-n-times f dx n)
  (repeated (smooth f dx) n))
