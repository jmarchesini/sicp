(define (key record) (car record))
(define (val record) (cdr record))
(define (make-record key val) (cons key val))
(define db (list
            (make-record 0 'value-0)
            (make-record 1 'value-1)
            (make-record 2 'value-2)
            (make-record 3 'value-3)))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((= given-key (key (car set-of-records)))
         (car set-of-records))
        ((< given-key (key (car set-of-records)))
         (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (car set-of-records)))
         (lookup given-key (right-branch set-of-records)))))


;; 1 ]=> (define tree-db (list->tree db))
;; ;Value: tree-db

;; 1 ]=> tree-db
;; ;Value: ((1 . value-1) ((0 . value-0) () ())
;;         ((2 . value-2) () ((3 . value-3) () ())))

;; 1 ]=> (lookup 0 tree-db)
;; ;Value: (0 . value-0)

;; 1 ]=> (lookup 1 tree-db)
;; ;Value: (1 . value-1)

;; 1 ]=> (lookup 2 tree-db)
;; ;Value: (2 . value-2)

;; 1 ]=> (lookup 3 tree-db)
;; ;Value: (3 . value-3)

;; 1 ]=> (lookup 4 tree-db)
;; ;Value: #f
