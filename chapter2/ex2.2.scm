(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment x y)
  (cons x y))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s))
                    (x-point (end-segment s)))
                 2)
              (/ (+ (y-point (start-segment s))
                    (y-point (end-segment s)))
                 2)))


;; 1 ]=> (define p0 (make-point 2 4))
;; 1 ]=> (define p1 (make-point 8 12))

;; 1 ]=> (print-point p0)
;; (2,4)

;; 1 ]=> (print-point p1)
;; (8,12)

;; 1 ]=> (define s (make-segment p0 p1))
;; 1 ]=> (define m (midpoint-segment s))

;; 1 ]=> (print-point m)
;; (5,8)

