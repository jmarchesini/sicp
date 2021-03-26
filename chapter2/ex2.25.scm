;; 1 ]=> (define q (list 1 3 (list 5 7) 9))
;; 1 ]=> (car (cdr (car (cdr (cdr q)))))
;; ;Value: 7



;; 1 ]=> (define p (list (list 7)))
;; 1 ]=> p
;; ;Value: ((7))

;; 1 ]=> (car (car p))
;; ;Value: 7



;; 1 ]=> (define r (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
;; ;Value: r

;; 1 ]=> r
;; ;Value: (1 (2 (3 (4 (5 (6 7))))))

;; 1 ]=> (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr r))))))))))))
;; ;Value: 7
