(load "stream.scm")

;; integers mul-streams added to stream.scm

(define factorials
  (cons-stream 1 (mul-streams factorials (stream-cdr integers))))


;; 1 ]=> (stream-ref factorials 0)
;; ;Value: 1

;; 1 ]=> (stream-ref factorials 1)
;; ;Value: 2

;; 1 ]=> (stream-ref factorials 2)
;; ;Value: 6

;; 1 ]=> (stream-ref factorials 3)
;; ;Value: 24

;; 1 ]=> (stream-ref factorials 4)
;; ;Value: 120
