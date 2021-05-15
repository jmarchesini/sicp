(define (union-set S1 S2)
  (cond ((null? S1) S2)
        ((null? S2) S1)
        ((= (car S1) (car S2))
         (cons (car S1) (union-set (cdr S1) (cdr S2))))
        ((< (car S1) (car S2))
         (cons (car S1) (union-set (cdr S1) S2)))
        (else
         (cons (car S2) (union-set S1 (cdr S2))))))


;; 1 ]=> evens
;; ;Value: (2 4 6 8)

;; 1 ]=> odds
;; ;Value: (1 3 5 7 9)

;; 1 ]=> (union-set evens odds)
;; ;Value: (1 2 3 4 5 6 7 8 9)
