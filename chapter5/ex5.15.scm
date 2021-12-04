;; Added instruction counting to regm-sim.scm

;; Example

;; 1 ]=> (load "ex5.7.a.scm")
;; 1 ]=> (set-register-contents! expt-machine 'b 2)
;; 1 ]=> (set-register-contents! expt-machine 'n 3)
;; 1 ]=> (start expt-machine)
;; 1 ]=> (get-register-contents expt-machine 'r)

;; ;Value: 8

;; 1 ]=> (print-instruction-count expt-machine)

;; (instruction-count = 32)
