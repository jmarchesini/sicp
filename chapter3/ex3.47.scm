(define (make-semaphore n)
  (let ((mutex (make-mutex))
        (count 0))
    (define (semaphore op)
      (cond ((eq? op 'acquire)
             (mutex 'aquire)
             (if (< count n)
                 (begin (set! count (+ count 1))
                        (mutex 'release))
                 (begin (mutex 'release)
                        (semaphore 'acquire))))
            ((eq? op 'release)
             (mutex 'aquire)
             (set! count (- count 1))
             (mutex 'release))))
    semaphore))

                 
                              
