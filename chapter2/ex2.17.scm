(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))


;; 1 ]=> (last-pair (list 1 2 3 4))
;; ;Value: (4)

;; 1 ]=> (last-pair (list "a" "b"))
;; ;Value: ("b")
