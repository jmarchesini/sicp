(load "stream.scm")
(load "ex3.77.scm")

(define (solve-2nd a b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (add-streams (scale-stream dy a)
                           (scale-stream y b)))
  y)


;; 1 ]=> (stream-ref (solve-2nd 1 0 0.0001 1 1) 10000)
;; ;Value: 2.7181459268252266
;; e

;; 1 ]=> (stream-ref (solve-2nd 0 -1 0.0001 1 0) 10472)
;; ;Value: .5000240628699462
;; cos pi/3 = 0.5

;; 1 ]=> (stream-ref (solve-2nd 0 -1 0.0001 0 1) 5236)
;; ;Value: .5000141490501059
;; sin pi/6 = 0.5
