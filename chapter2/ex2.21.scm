(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))


;; 1 ]=> (square-list (list 1 2 3 4))
;; ;Value: (1 4 9 16)

;; 1 ]=> (square-list-map (list 1 2 3 4))
;; ;Value: (1 4 9 16)
