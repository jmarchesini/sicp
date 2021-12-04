(load "regm-sim.scm")

(define sqrt-machine 
  (make-machine 
   '(x guess temp) 
   (list
    (list '- -)
    (list '< <)
    (list '/ /)
    (list '+ +)
    (list '* *)
    (list '> >)) 
   '((assign guess (const 1.0)) 
test-g 
     (assign temp (op *) (reg guess) (reg guess)) 
     (assign temp (op -) (reg temp) (reg x)) 
     (test (op >) (reg temp) (const 0)) 
     (branch (label iter)) 
     (assign temp (op -) (const 0) (reg temp)) 
iter 
     (test (op <) (reg temp) (const 0.001)) 
     (branch (label sqrt-done)) 
     (assign temp (op /) (reg x) (reg guess)) 
     (assign temp (op +) (reg temp) (reg guess)) 
     (assign guess (op /) (reg temp) (const 2)) 
     (goto (label test-g)) 
sqrt-done))) 

;; (set-register-contents! sqrt-machine 'x 2) 
;; (start sqrt-machine)
;; (get-register-contents sqrt-machine 'guess)
