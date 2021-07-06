(load "stream.scm")

(define (show x)
  (display-line x)
  x)


;; 1 ]=> (define x (stream-map show (stream-enumerate-interval 0 10)))
;; 0


;; 1 ]=> (stream-ref x 5)
;; 1
;; 2
;; 3
;; 4
;; 5


;; 1 ]=> (stream-ref x 7)
;; 6
;; 7

