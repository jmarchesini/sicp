(load "stream.scm")


;; 1 ]=> (define s (cons-stream 1 (add-streams s s)))
;; ;Value: s

;; 1 ]=> (stream-ref s 1)
;; ;Value: 2

;; 1 ]=> (stream-ref s 2)
;; ;Value: 4

;; 1 ]=> (stream-ref s 3)
;; ;Value: 8

;; 1 ]=> (stream-ref s 4)
;; ;Value: 16
