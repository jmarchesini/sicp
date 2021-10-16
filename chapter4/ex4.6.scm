(load "interpreter.scm")

;; To register in eval
;; ((let? exp) (eval (let->combination exp) env)) 

;; Let
(define (let? exp)
  (tagged-list? exp 'let)) 

(define (let-vars exp)
  (map car (cadr exp))) 

(define (let-inits exp)
  (map cadr (cadr exp))) 

(define (let-body exp)
  (cddr exp))

(define (let->combination exp)
  (cons (make-lambda (let-vars exp) (let-body exp))
        (let-inits exp)))
