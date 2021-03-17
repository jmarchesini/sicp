(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (evenly-divides n d)
  (define (iter x result)
    (if (= 0 (remainder x d))
        (iter (/ x d) (+ 1 result))
        result))
  (iter n 0))

(define (car x)
  (evenly-divides x 2))

(define (cdr x)
  (evenly-divides x 3))


;; 1 ]=> (define c (cons 2 4))
;; ;Value: c

;; 1 ]=> c
;; ;Value: 324

;; 1 ]=> (car c)
;; ;Value: 2

;; 1 ]=> (cdr c)
;; ;Value: 4
