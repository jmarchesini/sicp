;; Non-memoized run - final count is 2 since
;;                    the side effect of (id 10)
;;                    is calculated twice while
;;                    calculating the square.

;; ;;; L-Eval input:
;; (define count 0)

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (define (id x) (set! count (+ count 1)) x)

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (define (square x) (* x x))

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (square (id 10))

;; ;;; L-Eval value:
;; 100

;; ;;; L-Eval input:
;; count

;; ;;; L-Eval value:
;; 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Memoized run - final count is 1 since the
;;                side effect of (id 10) is
;;                an evaluated-thunk.

;; ;;; L-Eval input:
;; (define count 0)

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (define (id x) (set! count (+ count 1)) x)

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (define (square x) (* x x))

;; ;;; L-Eval value:
;; ok

;; ;;; L-Eval input:
;; (square (id 10))

;; ;;; L-Eval value:
;; 100

;; ;;; L-Eval input:
;; count

;; ;;; L-Eval value:
;; 1
