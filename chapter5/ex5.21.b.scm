(load "regm-sim.scm")

(define count-leaves-iter
  (make-machine
   '(tree n rv tmp1 tmp2 ra)
   (list (list '= =)
         (list '+ +)
         (list 'car car)
         (list 'cdr cdr)
         (list 'not not)
         (list 'null? null?)
         (list 'pair? pair?))
   '((goto (label machine-start))

count
     (restore ra)
     (restore tmp1) ; tree
     (restore tmp2) ; n
     (save tree)
     (save n)
     (save ra)
     (assign tree (reg tmp1))
     (assign n (reg tmp2))

count-loop
     (test (op null?) (reg tree))
     (branch (label label-null))
     (test (op pair?) (reg tree))
     (branch (label label-pair))
     (goto (label label-atom))

label-pair
     (save n)
     (assign tmp1 (op car) (reg tree))
     (save tmp1)
     (assign ra (label after-first-return))
     (save ra)
     (goto (label count))

after-first-return
     (assign n (reg rv))
     (assign tree (op cdr) (reg tree))
     (goto (label count-loop))

label-null
     (assign rv (reg n))
     (goto (label label-end))

label-atom
     (assign rv (op +) (reg n) (const 1))
     (goto (label label-end))

label-end
     (restore ra)
     (restore n)
     (restore tree)
     (goto (reg ra))

machine-start
     (assign n (const 0))
     (save n)
     (save tree)
     (assign ra (label machine-end))
     (save ra)
     (goto (label count))     

machine-end)))


;; 1 ]=> (set-register-contents! count-leaves-iter 'tree '(a (b c (d)) (e f) g))
;; 1 ]=> (start count-leaves-iter)
;; 1 ]=> (get-register-contents count-leaves-iter 'rv)

;; ;Value: 7
