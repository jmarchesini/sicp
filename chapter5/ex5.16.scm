;; Added instruction tracing to regm-sim.scm

;; Example

;; 1 ]=> (load "ex5.7.a.scm")
;; 1 ]=> (instruction-trace-on expt-machine)
;; 1 ]=> (set-register-contents! expt-machine 'b 2)
;; 1 ]=> (set-register-contents! expt-machine 'n 3)
;; 1 ]=> (start expt-machine)

;; (assign continue (label expt-done))
;; (test (op =) (reg n) (const 0))
;; (branch (label expt-base))
;; (save continue)
;; (assign n (op -) (reg n) (const 1))
;; (assign continue (label after-expt))
;; (goto (label expt-loop))
;; (test (op =) (reg n) (const 0))
;; (branch (label expt-base))
;; (save continue)
;; (assign n (op -) (reg n) (const 1))
;; (assign continue (label after-expt))
;; (goto (label expt-loop))
;; (test (op =) (reg n) (const 0))
;; (branch (label expt-base))
;; (save continue)
;; (assign n (op -) (reg n) (const 1))
;; (assign continue (label after-expt))
;; (goto (label expt-loop))
;; (test (op =) (reg n) (const 0))
;; (branch (label expt-base))
;; (assign r (const 1))
;; (goto (reg continue))
;; (restore continue)
;; (assign r (op *) (reg r) (reg b))
;; (goto (reg continue))
;; (restore continue)
;; (assign r (op *) (reg r) (reg b))
;; (goto (reg continue))
;; (restore continue)
;; (assign r (op *) (reg r) (reg b))
;; (goto (reg continue))

;; 1 ]=> (get-register-contents expt-machine 'r)

;; ;Value: 8

;; 1 ]=> (print-instruction-count expt-machine)

;; (instruction-count = 32)
