(define (encode message tree)
  (if (null? message)
      '()
      (append 
       (encode-symbol (car message) 
                      tree)
       (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((element-of-set? symbol
                          (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else
         (cons 0 (encode-symbol symbol (left-branch tree))))))

(define (element-of-set? x S)
  (cond ((null? S) false)
        ((equal? x (car S)) true)
        (else (element-of-set? x (cdr S)))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
      

;; 1 ]=> (define sample-to-encode '(a d a b b c a))
;; ;Value: sample-to-encode

;; 1 ]=> (encode sample-to-encode sample-tree)
;; ;Value: (0 1 1 0 0 1 0 1 0 1 1 1 0)
