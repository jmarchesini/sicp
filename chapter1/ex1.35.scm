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


;; 1 ]=> (fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0 )
;; Value: 1.6180327868852458

;; 1 ]=> (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;; Value: 1.6180327868852458

;; 1 ]=> (fixed-point (lambda (x) (+ 1 (/ 1 x))) 50.0)
;; Value: 1.618032839977977

;; 1 ]=> (fixed-point (lambda (x) (+ 1 (/ 1 x))) -9.0)
;; Value: 1.618032466262468

