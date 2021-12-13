(load "compiler.scm")

(define compiled-factorial (compile 
  '(define (factorial n) 
     (if (= n 1) 
         1 
         (* (factorial (- n 1)) n)))
  'val 
  'next))

(format-object-code (instruction-list compiled-factorial))