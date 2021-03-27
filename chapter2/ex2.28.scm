(define (fringe items)
  (cond ((null? items) '())
        ((not (pair? items)) (list items))
        (else (append (fringe (car items)) (fringe (cdr items))))))


;; 1 ]=> (define t (list (list 1 2) (list 3 4)))
;; ;Value: t

;; 1 ]=> (fringe t)
;; ;Value: (1 2 3 4)

;; 1 ]=> (fringe (list t t))
;; ;Value: (1 2 3 4 1 2 3 4)

