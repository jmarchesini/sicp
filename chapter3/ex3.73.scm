(load "stream.scm")

(define (RC R C dt)
  (define (voltage-stream i v0)
    (add-streams
     (scale-stream i R)
     (scale-stream (integral i v0 dt) (/ 1 C))))
  voltage-stream)


;; 1 ]=> (define RC1 (RC 5 1 0.5))
;; ;Value: rc1

;; 1 ]=> (define c (RC1 ones 0))
;; ;Value: c

;; 1 ]=> (display-stream c)
;; 5
;; 5.5
;; 6.
;; 6.5
;; 7.
;; 7.5
;; 8.
;; 8.5
;; 9.
;; 9.5
;; 10.
;; 10.5
;; 11.
;; 11.5
;; 12.
;; 12.5
;; 13.
;; 13.5
;; 14.
;; 14.5
;; 15.
;; 15.5
