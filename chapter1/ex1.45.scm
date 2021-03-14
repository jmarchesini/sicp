(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average (f x) x)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f x)
  (if (= x 1)
      f
      (compose f (repeated f (- x 1)))))

(define (nth-root-less-than-4 x n)
  (fixed-point 
   (average-damp (lambda (y) (/ x (expt y (- n 1)))))
   1.0))

(define (log-base-2 x)
  (/ (log x) (log 2)))

(define (nth-root x n)
  (fixed-point
   ((repeated average-damp (log-base-2 n))
    (lambda (y) (/ x (expt y (- n 1)))))
   1.0))
