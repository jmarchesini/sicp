(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) 
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) 
                 trials-passed))))
  (iter trials 0))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (test)
    (p (random-in-range x1 x2)
       (random-in-range y1 y2)))
  (monte-carlo trials test))

(define (predicate x y)
  (<= (+
       (square (- x 5))
       (square (- y 7)))
      (square 3)))

(define pi-approx 
   (/ (* (estimate-integral predicate 2.0 8.0 4.0 10.0 100000) 36) 
      9.0))

;; 1 ]=> (pi-approx)
;; ;The object 3.1471199999999997 is not applicable.
