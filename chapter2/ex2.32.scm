(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x))
                          rest)))))


;; 1 ]=> (subsets (list 1 2 3))
;; ;Value: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
