(load "constraint.scm")

(define (squarer a b)
  (multiplier a a b))


;; 1 ]=> (define a (make-connector))
;; ;Value: a

;; 1 ]=> (define b (make-connector))
;; ;Value: b

;; 1 ]=> (squarer a b)
;; ;Value: #[compound-procedure 20 me]

;; 1 ]=> (set-value! a 7 'a)
;; ;Value: done

;; 1 ]=> (get-value b)
;; ;Value: 49

;; 1 ]=> (set-value! b 100 'b)
;; ;Contradiction (49 100)
