;; Part a: (define x 3) would get passed to apply, likely fail the tests
;;         for primitive-procedure? and compound-procedure? and match
;;         the else error case in the conditional.

;; Part b
(define (application? exp)
  (tagged-list? exp 'call))

(define (operator exp)
  (cadr exp))

(define (operands exp)
  (cddr exp))
