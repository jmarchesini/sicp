;; Added register tracing to regm-sim.scm

;; Example
;;
;; 1 ]=> (load "ex5.7.a.scm")
;; 1 ]=> (register-trace-on expt-machine 'r)
;; 1 ]=> (set-register-contents! expt-machine 'b 2)
;; 1 ]=> (set-register-contents! expt-machine 'n 10)
;; 1 ]=> (start expt-machine)

;; reg: r old: 8 new: 1
;; reg: r old: 1 new: 2
;; reg: r old: 2 new: 4
;; reg: r old: 4 new: 8
;; reg: r old: 8 new: 16
;; reg: r old: 16 new: 32
;; reg: r old: 32 new: 64
;; reg: r old: 64 new: 128
;; reg: r old: 128 new: 256
;; reg: r old: 256 new: 512
;; reg: r old: 512 new: 1024

;; 1 ]=> (get-register-contents expt-machine 'r)

;; Value: 1024
