(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
        (cons (* -1 (/ n g)) (* -1 (/ d g)))
        (cons (/ n g) (/ d g)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


;; 1 ]=> (define a (make-rat -1 -2)) 
;; 1 ]=> (print-rat a)
;; 1/2

;; 1 ]=> (define b (make-rat 1 -2)) 
;; 1 ]=> (print-rat b)
;; -1/2

;; 1 ]=> (define c (make-rat -1 2)) 
;; 1 ]=> (print-rat c)
;; -1/2

;; 1 ]=> (define d (make-rat 1 2)) 
;; 1 ]=> (print-rat d)
;; 1/2
