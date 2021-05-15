(define (element-of-set? x S)
  (cond ((null? S) false)
        ((equal? x (car S)) true)
        (else (element-of-set? x (cdr S)))))

(define (adjoin-set x S)
  (if (element-of-set? x S)
      S
      (cons x S)))

(define (intersection-set S1 S2)
  (cond ((or (null? S1) (null? S2)) '())
        ((element-of-set? (car S1) S2)
         (cons (car S1)
               (intersection-set (cdr S1) S2)))
        (else (intersection-set (cdr S1) S2))))

(define (union-set S1 S2)
  (cond ((null? S1) S2)
        ((null? S2) S1)
        ((element-of-set? (car S1) S2)
         (union-set (cdr S1) S2))
        (else
         (cons (car S1) (union-set (cdr S1) S2)))))


;; 1 ]=> (define odds '(1 3 5 7 9))
;; ;Value: odds

;; 1 ]=> (define evens '(2 4 6 8))
;; ;Value: evens

;; 1 ]=> (define primes '(2 3 5 7))
;; ;Value: primes

;; 1 ]=> (element-of-set? 5 odds)
;; ;Value: #t

;; 1 ]=> (element-of-set? 6 odds)
;; ;Value: #f

;; 1 ]=> (intersection-set evens odds)
;; ;Value: ()

;; 1 ]=> (intersection-set primes odds)
;; ;Value: (3 5 7)

;; 1 ]=> (intersection-set primes evens)
;; ;Value: (2)

;; 1 ]=> (union-set odds evens)
;; ;Value: (1 3 5 7 9 2 4 6 8)

