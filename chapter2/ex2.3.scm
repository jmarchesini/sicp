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

(define (segment-length s)
  (sqrt
   (+
    (square (- (x-point (start-segment s)) (x-point (end-segment s))))
    (square (- (y-point (start-segment s)) (y-point (end-segment s)))))))
    

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Construct from segments h and w
;; (define (make-rect h w)
;;   (cons h w))

;; (define (rect-height r)
;;    (segment-length (car r)))

;; (define (rect-width r)
;;    (segment-length (cdr r)))

;; Alternate rectangle from a point, a width, and a height
(define (make-rect a w h)
  (cons a (cons w h)))

(define (rect-width r)
   (car (cdr r)))

(define (rect-height r)
   (cdr (cdr r)))

;; Client code
(define (rect-perimeter r)
   (* 2 (+ (rect-width r) (rect-height r))))

(define (rect-area r)
   (* (rect-width r) (rect-height r)))
