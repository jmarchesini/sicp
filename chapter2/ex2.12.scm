(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

(define (percent i)
  (* 100.0 (/ (width i) (center i))))


;; 1 ]=> (define a (make-center-percent 1 25))
;; ;Value: a

;; 1 ]=> a
;; ;Value: (.75 . 1.25)

;; 1 ]=> (center a)
;; ;Value: 1.

;; 1 ]=> (width a)
;; ;Value: .25

;; 1 ]=> (percent a)
;; ;Value: 25.
