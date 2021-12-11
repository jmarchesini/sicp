;; In eceval-operations
(list 'cond? cond)
(list 'cond->if cond-if)

;; In eval-dispatch
(test (op cond?) (reg exp))
(branch (lavel ev-cond))

;; New label
ev-cond
  (assign exp (op cond->if) (reg exp))
  (goto (label ev-if))