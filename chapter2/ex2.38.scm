(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


;; 1 ]=> (fold-right / 1 (list 1 2 3))
;; ;Value: 3/2

;; 1 ]=> (fold-left / 1 (list 1 2 3))
;; ;Value: 1/6

;; 1 ]=> (fold-right list '() (list 1 2 3))
;; ;Value: (1 (2 (3 ())))

;; 1 ]=> (fold-left list '() (list 1 2 3))
;; ;Value: (((() 1) 2) 3)
