(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;; (lambda (f) (lambda (x) (f x)))
(define one
  (lambda (f) (lambda (x) (f x))))

;; (add-1 one)
;; (lambda (f) (lambda (x) (f ((one f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;; (lambda (f) (lambda (x) (f (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; (add-m n)
;; m = CN1: (lambda (f) (lambda (x) ((m f) ((n f) x)))))
(define (add-church-numerals m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define three
  (add-church-numerals one two))

;; 1 ]=> ((zero square) 2)
;Value: 2

;; 1 ]=> ((one square) 2)
;; ;Value: 4

;; 1 ]=> ((two square) 2)
;; ;Value: 16

;; 1 ]=> ((three square) 2)
;; ;Value: 256

