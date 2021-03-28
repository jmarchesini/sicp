(define (square-tree-direct tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-direct (car tree))
                    (square-tree-direct (cdr tree))))))

(define (square-tree-rec tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-rec sub-tree)
             (square sub-tree)))
       tree))


;; 1 ]=> (define t (list 1
;; (list 2 (list 3 4) 5)
;; (list 6 7)))

;; 1 ]=> t
;; ;Value: (1 (2 (3 4) 5) (6 7))


;; 1 ]=> (square-tree-direct t)
;; ;Value: (1 (4 (9 16) 25) (36 49))

;; 1 ]=> (square-tree-rec t)
;; ;Value: (1 (4 (9 16) 25) (36 49))
