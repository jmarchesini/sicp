(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


(define (same-parity a . z)  
  (define (parity? i j)
    (if (= (remainder i 2) (remainder j 2))
        true
        false))
  (define (iter l res)
    (if (null? l)
        res
        (iter (cdr l)
              (if (parity? a (car l))
                  (append res (list (car l)))
                  res))))
  (iter z (list a)))


;; 1 ]=> (same-parity 1 2 3 4 5 6 7)
;; ;Value: (1 3 5 7)

;; 1 ]=> (same-parity 2 3 4 5 6 7)
;; ;Value: (2 4 6)
