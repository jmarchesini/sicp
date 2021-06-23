(define (count-pairs x) 
  (let ((visited '())) 
    (define (visit x) 
      (if (or (not (pair? x)) (memq x visited)) 
          0 
          (begin 
            (set! visited (cons x visited)) 
            (+ (visit (car x)) 
               (visit (cdr x)) 
               1)))) 
    (visit x)))


;; 1 ]=> (define a (cons 1 2))
;; ;Value: a

;; 1 ]=> (define b (cons 1 2))
;; ;Value: b

;; 1 ]=> (define c (cons a b))
;; ;Value: c

;; 1 ]=> (set-car! a b)
;; ;Unspecified return value

;; 1 ]=> (count-pairs c)
;; ;Value: 3
