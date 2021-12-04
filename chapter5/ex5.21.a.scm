(load "regm-sim.scm")

(define count-leaves-rec
  (make-machine
   '(tree n rv tmp ra)
   (list (list '= =)
         (list '+ +)
         (list 'car car)
         (list 'cdr cdr)
         (list 'not not)
         (list 'null? null?)
         (list 'pair? pair?))
   '((goto (label machine-start))
count-loop
     (restore ra)
     (restore tmp)
     (save tree)
     (save n)
     (save ra)
     (assign tree (reg tmp))
     (test (op null?) (reg tree))
     (branch (label label-null))
     (test (op pair?) (reg tree))
     (branch (label label-pair))
     (goto (label label-atom))
label-pair
     (assign tmp (op car) (reg tree))
     (save tmp)
     (assign ra (label after-first-return))
     (save ra)
     (goto (label count-loop))
after-first-return
     (assign n (reg rv))
     (assign tmp (op cdr) (reg tree))
     (save tmp)
     (assign ra (label after-second-return))
     (save ra)
     (goto (label count-loop))
after-second-return
     (assign rv (op +) (reg n) (reg rv))
     (goto (label label-end))
label-null
     (assign rv (const 0))
     (goto (label label-end))
label-atom
     (assign rv (const 1))
     (goto (label label-end))
label-end
     (restore ra)
     (restore n)
     (restore tree)
     (goto (reg ra))
machine-start
     (save tree)
     (assign ra (label machine-end))
     (save ra)
     (goto (label count-loop))     
machine-end)))


;; 1 ]=> (set-register-contents! count-leaves-rec 'tree '(a (b c (d)) (e f) g))
;; 1 ]=> (start count-leaves-rec)
;; 1 ]=> (get-register-contents count-leaves-rec 'rv)

;; ;Value: 7
