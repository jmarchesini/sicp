(load "constraint.scm")

(define (averager a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (adder a b u)
    (multiplier c v u)
    (constant 2 v)))


;; 1 ]=> (define a (make-connector))
;; ;Value: a

;; 1 ]=> (define b (make-connector))
;; ;Value: b

;; 1 ]=> (define c (make-connector))
;; ;Value: c

;; 1 ]=> (averager a b c)
;; ;Value: #[compound-procedure 17 me]

;; 1 ]=> (set-value! a 10 'a)
;; ;Value: done

;; 1 ]=> (set-value! b 20 'b)
;; ;Value: done

;; 1 ]=> (get-value c)
;; ;Value: 15
