(load "huffman.scm")

(define (generate-huffman-tree pairs)
  (successive-merge 
   (make-leaf-set pairs)))

(define (successive-merge tree)
  (if (null? (cdr tree))
      tree
      (successive-merge (adjoin-set
                         (make-code-tree (car tree) (cadr tree))
                         (cddr tree)))))

(define example-tree (generate-huffman-tree
                      (list
                       (list 'A 8)
                       (list 'B 3)
                       (list 'C 1)
                       (list 'D 1)
                       (list 'E 1)
                       (list 'F 1)
                       (list 'G 1)
                       (list 'H 1))))

;; 1 ]=> example-tree
;;
;; Value:
;; (((leaf a 8)
;;
;; (
;;  (((leaf h 1) (leaf g 1) (h g) 2)
;;   ((leaf f 1) (leaf e 1) (f e) 2)
;;    (h g f e) 4)
;;
;;  (((leaf d 1) (leaf c 1) (d c) 2)
;;    (leaf b 3) (d c b) 5)
;;
;;  (h g f e d c b) 9)
;;  (a h g f e d c b) 17)
;; )
;;
;; See Fig 2.18
