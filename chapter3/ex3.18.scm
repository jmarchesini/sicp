(define (has-cycle? x)
  (let ((visited '()))
    (define (visit x)
      (cond ((null? x) #f)
            ((memq x visited) #t)
            (else
             (set! visited (cons x visited))
             (visit (cdr x)))))
    (visit x)))


;; 1 ]=> (define a (list 1 2 3))
;; ;Value: a

;; 1 ]=> (has-cycle? a)
;; ;Value: #f

;; 1 ]=> (define b (cons a a))
;; ;Value: b

;; 1 ]=> b
;; ;Value: ((1 2 3) 1 2 3)

;; 1 ]=> (has-cycle? b)
;; ;Value: #f

;; 1 ]=> (define a (list 1 2 3))
;; ;Value: a

;; 1 ]=> a
;; ;Value: (1 2 3)

;; 1 ]=> (append! a a)
;; ;Value: #0=(1 2 3 . #0#)

;; 1 ]=> (has-cycle? a)
;; ;Value: #t
