(load "stream.scm")

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0 (stream-map
                      (lambda (guess)
                        (sqrt-improve guess x))
          guesses)))
  guesses)

(define (stream-limit s tolerance)
  (let ((a (stream-ref s 0))
        (b (stream-ref s 1)))
    (if (< (abs (- b a)) tolerance)
        b
        (stream-limit (stream-cdr s) tolerance))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))


;; 1 ]=> (sqrt 2 .01)
;; ;Value: 1.4142156862745097

;; 1 ]=> (sqrt 2 .001)
;; ;Value: 1.4142135623746899

;; 1 ]=> (sqrt 2 .0001)
;; ;Value: 1.4142135623746899

;; 1 ]=> (sqrt 2 .000001)
;; ;Value: 1.414213562373095
