(load "regm-sim.scm")

(define expt-machine
  (make-machine
   '(b n r continue)
   (list (list '= =) (list '* *) (list '- -))
   '((assign continue (label expt-done))
expt-loop
     (test (op =) (reg n) (const 0))
     (branch (label expt-base))
     (save continue)
     (assign n (op -) (reg n) (const 1))
     (assign continue (label after-expt))
     (goto (label expt-loop))
after-expt
     (restore continue)
     (assign r (op *) (reg r) (reg b))
     (goto (reg continue))
expt-base
     (assign r (const 1))
     (goto (reg continue))
expt-done)))

;; (set-register-contents! expt-machine 'b 2)
;; (set-register-contents! expt-machine 'n 5)
;; (start expt-machine)
;; (get-register-contents expt-machine 'r)
;; (print-stack-statistics expt-machine)
