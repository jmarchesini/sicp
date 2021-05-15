(define (adjoin-set x S)
  (cond ((null? S) (cons x '()))
        ((= x (car S)) S)
        ((< x (car S)) (cons x S))
        ((> x (car S))
         (cons (car S) (adjoin-set x (cdr S))))))


;; 1 ]=> (adjoin-set 2 '())
;; ;Value: (2)

;; 1 ]=> (adjoin-set 2 '(2 3 4))
;; ;Value: (2 3 4)

;; 1 ]=> (adjoin-set 2 '(3 4))
;; ;Value: (2 3 4)

;; 1 ]=> (adjoin-set 2 '(1 3))
;; ;Value: (1 2 3)

;; 1 ]=> (adjoin-set 2 '(0 1))
;; ;Value: (0 1 2)
