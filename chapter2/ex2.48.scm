(define (make-segment x y)
  (cons x y))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))
