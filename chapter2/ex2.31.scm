(define (square-tree tree)
  (tree-map square tree))

(define (tree-map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))


;; 1 ]=> (square-tree t)
;; ;Value: (1 (4 (9 16) 25) (36 49))
