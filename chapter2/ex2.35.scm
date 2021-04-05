(define (accumulate op initial sequence)
  (if (null? sequence)
       initial
       (op (car sequence)
           (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
         ((not (pair? tree)) (list tree))
         (else (append (enumerate-tree (car tree))
                       (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))


;; 1 ]=> (count-leaves (list (list 1 2) (list 1 2 3) 1))
;; ;Value: 6
