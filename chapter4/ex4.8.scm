(load "interpreter.scm")

(define (named-let? exp)
  (and (let? exp) (symbol? (cadr exp))))

(define (named-let-name exp)
  (cadr exp))

(define (named-let-body exp)
  (cadddr exp))

(define (named-let-parameters exp)
  (map car (caddr exp)))

(define (named-let-inits exp)
  (map cadr (caddr exp)))

 (define (named-let->func exp)
     (list 'define
           (cons (named-let-name exp)
                 (named-let-parameters exp))
           (named-let-body exp)))
  
 (define (let->combination exp)
     (if (named-let? exp)
         (sequence->exp
           (list (named-let->func exp)
                 (cons (named-let-name exp)
                       (named-let-inits exp))))
         (cons (make-lambda (let-vars exp)
               (list (let-body exp)))
               (let-inits exp))))
