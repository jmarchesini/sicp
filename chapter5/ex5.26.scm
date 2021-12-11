;; (a)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))
(total-pushes = 3 maximum-depth = 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 1)
(total-pushes = 64 maximum-depth = 10)

;;; EC-Eval value:
1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 2)
(total-pushes = 99 maximum-depth = 10)
;;; EC-Eval value:
2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 4)
(total-pushes = 169 maximum-depth = 10)
;;; EC-Eval value:
24

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 8)
(total-pushes = 309 maximum-depth = 10)
;;; EC-Eval value:
40320

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EC-Eval input:
(factorial 16)
(total-pushes = 589 maximum-depth = 10)
;;; EC-Eval value:
20922789888000


;; (b) => pushes = 29 + 35n