(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


;; 1 ]=> (define ret-3 (list 1 2 3))
;; ;Value: ret-3

;; 1 ]=> (count-pairs ret-3)
;; ;Value: 3


;; 1 ]=> (define a (cons 1 2))
;; ;Value: a

;; 1 ]=> (define b (cons 1 2))
;; ;Value: b

;; 1 ]=> (define c (cons a b))
;; ;Value: c

;; 1 ]=> (set-car! a b)
;; ;Unspecified return value

;; 1 ]=> (count-pairs c)
;; ;Value: 4


;; 1 ]=> (define a (cons 1 2))
;; ;Value: a

;; 1 ]=> (define b (cons a a))
;; ;Value: b

;; 1 ]=> (define c (cons b b))
;; ;Value: c

;; 1 ]=> (count-pairs c)
;; ;Value: 7


;; 1 ]=> (define loop (list 1 2 3))
;; ;Value: loop

;; 1 ]=> (set-cdr! loop loop)
;; ;Unspecified return value

;; 1 ]=> (count-pairs loop)
;; ;Aborting!: maximum recursion depth exceeded
