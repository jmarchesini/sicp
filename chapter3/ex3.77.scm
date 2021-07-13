(define (integral delayed-integrand initial-value dt)
  (cons-stream initial-value
               (if (stream-null? (force delayed-integrand))
                   the-empty-stream
                   (integral (delay (stream-cdr (force delayed-integrand)))
                             (+ (* dt (stream-car (force delayed-integrand)))
                                initial-value)
                             dt))))
