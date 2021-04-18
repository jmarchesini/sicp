(define (split direction-1 direction-2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split direction-1 direction-2) painter (- n 1))))
          (direction-1 painter (direction-2 smaller smaller))))))
