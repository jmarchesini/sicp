(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))


;; 1 ]=> (define x (list 'a 'b))
;; ;Value: x

;; 1 ]=> (define y (list 'c 'd))
;; ;Value: y

;; 1 ]=> (define z (append x y))
;; ;Value: z

;; 1 ]=> z
;; ;Value: (a b c d)

;; 1 ]=> (cdr x)
;; ;Value: (b)

;; 1 ]=> (define w (append! x y))
;; ;Value: w

;; 1 ]=> w
;; ;Value: (a b c d)

;; 1 ]=> (cdr x)
;; ;Value: (b c d)

