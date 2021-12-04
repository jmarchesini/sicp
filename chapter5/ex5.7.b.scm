(load "regm-sim.scm")

(define expt-machine
  (make-machine
   '(b n r)
   (list (list '= =) (list '* *) (list '- -))
   '((assign r (const 1))
expt-loop
     (test (op =) (reg n) (const 0))
     (branch (label expt-done))
     (assign r (op *) (reg r) (reg b))
     (assign n (op -) (reg n) (const 1))
     (goto (label expt-loop))
expt-done)))

;; (set-register-contents! expt-machine 'b 2)
;; (set-register-contents! expt-machine 'n 5)
;; (start expt-machine)
;; (get-register-contents expt-machine 'r)
