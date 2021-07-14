(load "stream.scm")
(load "ex3.77.scm")

(define (solve-2nd dt y0 dy0 f)
  (define y   (integral (delay dy) y0 dt))
  (define dy  (integral (delay ddy) dy0 dt))
  (define ddy (stream-map f dy y))
  y)
