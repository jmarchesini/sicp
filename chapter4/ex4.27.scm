;; count = 1 : The outer call to id in the def of w increments count by 1.
;;             The inner call remains unevaluated - a thunk.

;; w = 10    : When w is evaluated, the thunk is forced and 10 is returned.
;;             Since evaluating id has a side effect, count is bumped to 2.

;; count = 2 : Cy D. Fect strikes again.


;; 1 ]=> (load "lazy-interpreter.scm")
;; ;Loading "lazy-interpreter.scm"...

;; ;;; L-Eval input:
;; (define count 0)

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (define (id x) (set! count (+ count 1)) x)

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (define w (id (id 10)))

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; count

;; ;;; L-Eval value:
;; 1

;; ;;; L-Eval input:
;; w

;; ;;; L-Eval value:
;; 10

;; ;;; L-Eval input:
;; count

;; ;;; L-Eval value:
;; 2

