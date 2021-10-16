(load "interpreter.scm")
(load "../chapter3/ex3.24.scm")

(put 'op 'quote text-of-quotation)
(put 'op 'set! eval-assignment) 
(put 'op 'define eval-definition) 
(put 'op 'if eval-if) 
(put 'op 'lambda (lambda (x y)  
                   (make-procedure
                    (lambda-parameters x) (lambda-body x) y))) 
(put 'op 'begin (lambda (x y)  
                  (eval-sequence
                   (begin-sequence x) y))) 
(put 'op 'cond (lambda (x y)  
                 (eval (cond->if x) y))) 

(define (eval expr env)  
  (cond ((self-evaluating? expr) expr)
        ((variable? expr) (lookup-variable-value expr env))
        ((get 'op (operator expr)) ((get 'op (operator expr)) expr env))
        ((application? expr)
         (apply (eval (operator expr) env)
                (list-of-values (operands expr) env)))
        (else (error "Unknown expression type -- EVAL" expr))))
