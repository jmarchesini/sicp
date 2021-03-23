(define (my-for-each proc items)
   (cond ((null? items) #t)
         (else (proc (car items))
               (my-for-each proc (cdr items)))))

;; 1 ]=> (my-for-each (lambda (x) (newline) (display x)) (list 57 21 378))
;; 57
;; 21
;; 378
;; ;Value: #t
