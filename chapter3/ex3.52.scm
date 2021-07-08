(load "stream.scm")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))


;; 1 ]=> (stream-ref y 7)
;; ;Value: 136

;; 1 ]=> sum
;; ;Value: 136

;; 1 ]=> (display-stream z)
;; 10
;; 15
;; 45
;; 55
;; 105
;; 120
;; 190
;; 210

;; 1 ]=> sum
;; ;Value: 210

