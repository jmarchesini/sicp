;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(define (factorial n)
  (if (= n 1)
      1
      (* (factorial (- n 1)) n)))

(total-pushes = 3 maximum-depth = 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 1)
(total-pushes = 16 maximum-depth = 8)
;;; EC-Eval value:
1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 2)
(total-pushes = 48 maximum-depth = 13)
;;; EC-Eval value:
2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 4)
(total-pushes = 112 maximum-depth = 23)
;;; EC-Eval value:
24

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 8)
(total-pushes = 240 maximum-depth = 43)
;;; EC-Eval value:
40320

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 16)
(total-pushes = 496 maximum-depth = 83)
;;; EC-Eval value:
20922789888000


;; (b) => pushes = 16 + 32(n - 1)