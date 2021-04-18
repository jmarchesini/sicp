(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect u v)
  (make-vect (+ (xcor-vect u) (xcor-vect v))
             (+ (ycor-vect u) (ycor-vect v))))

(define (sub-vect u v)
  (make-vect (- (xcor-vect u) (xcor-vect v))
             (- (ycor-vect u) (ycor-vect v))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))


;; 1 ]=> (define u (make-vect 2 5))
;; ;Value: u

;; 1 ]=> (define v (make-vect 3 6))
;; ;Value: v

;; 1 ]=> u
;; ;Value: (2 . 5)

;; 1 ]=> v
;; ;Value: (3 . 6)

;; 1 ]=> (define a (add-vect u v))
;; ;Value: a

;; 1 ]=> a
;; ;Value: (5 . 11)

;; 1 ]=> (define m (sub-vect u v))
;; ;Value: m

;; 1 ]=> m
;; ;Value: (-1 . -1)

;; 1 ]=> (define s (scale-vect 10 u))
;; ;Value: s

;; 1 ]=> s
;; ;Value: (20 . 50)
