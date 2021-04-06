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

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))


;; 1 ]=> (reverse-right (list 1 2 3 4))
;; ;Value: (4 3 2 1)

;; 1 ]=> (reverse-left (list 1 2 3 4))
;; ;Value: (4 3 2 1)

;; 1 ]=> (reverse-right (reverse-left (list 1 2 3 4)))
;; ;Value: (1 2 3 4)
